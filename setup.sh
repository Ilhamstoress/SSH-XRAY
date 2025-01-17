#!/bin/bash
#link izin ip vps
url_izin='https://raw.githubusercontent.com/Ilhamstoress/izinip/main/ip'

#IP VPS
ip_vps=$(curl -sS ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
    echo "IP VPS tidak ditemukan dalam izin.txt"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

############# ILHAM STORE #############
#Text Coloring
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
############# ILHAM STORE #############

#System version number
cd
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray

clear
echo -e "[ ${tyblue}NOTES${NC} ] AUTO INSTALL SCRIPT.... "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] Multi path, Multi port, support debian 10 , Ubuntu 20"
sleep 2
echo -e "[ ${green}INFO${NC} ] BY ILHAM"
sleep 1
echo -e "[ ${green}INFO${NC} ] ILHAMSTORESS "
sleep 5

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END

chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Preparing the install file 🛠"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Alright good ... installation file is ready 📡"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : success 😁"
sleep 3
mkdir -p /etc/yudhynetwork
mkdir -p /etc/yudhynetwork/theme
mkdir -p /var/lib/yudhynetwork-pro >/dev/null 2>&1
echo "IP=" >> /var/lib/yudhynetwork-pro/ipvps.conf

if [ -f "/etc/xray/domain" ]; then
echo ""
echo -e "[ ${green}INFO${NC} ] Script Already Installed"
echo -ne "[ ${yell}WARNING${NC} ] Do you want to install again ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
rm setup.sh
sleep 10
exit 0
else
clear
fi
fi

echo ""
wget -q https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/dependencies.sh;chmod +x dependencies.sh;./dependencies.sh
rm dependencies.sh
clear

yellow "Add Your Domain"
echo " "
read -rp "Input your domain : " -e pp
echo "$pp" > /root/domain
echo "$pp" > /root/scdomain
echo "$pp" > /etc/xray/domain
echo "$pp" > /etc/xray/scdomain
echo "IP=$pp" > /var/lib/yudhynetwork-pro/ipvps.conf

############# LawNET #############
#THEME RED
cat <<EOF>> /etc/yudhynetwork/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
#THEME BLUE
cat <<EOF>> /etc/yudhynetwork/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
#THEME GREEN
cat <<EOF>> /etc/yudhynetwork/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
#THEME YELLOW
cat <<EOF>> /etc/yudhynetwork/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME MAGENTA
cat <<EOF>> /etc/yudhynetwork/theme/magenta
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME CYAN
cat <<EOF>> /etc/yudhynetwork/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
#THEME CONFIG
cat <<EOF>> /etc/yudhynetwork/theme/color.conf
blue
EOF
############# LawNET #############


#install ssh ovpn
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|     PROCESS INSTALLED SSH & OPENVPN      |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#install UDP-CUSTOM 
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|     PROCESS INSTALLED UDP CUSTOM      |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/udp.sh && chmod +x udp.sh && ./udp.sh
#Install Xray
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED XRAY          |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
#Install SSH Websocket
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|      PROCESS INSTALLED WEBSOCKET SSH     |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/insshws.sh && chmod +x insshws.sh && ./insshws.sh
#Install OHP Websocket
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED OHP           |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/ohp.sh && chmod +x ohp.sh && ./ohp.sh
#Install AutoBackup
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED AUTO BACKUP           |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#Download Extra Menu
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|           DOWNLOAD EXTRA MENU            |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
wget https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/update.sh && chmod +x update.sh && ./update.sh
clear

############# Ilhamstoress #############

cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
#menu
vnstat -d
vnstat -m
END
chmod 644 /root/.profile

############# Ilhamstoress #############

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps

############# Ilhamstoress #############

echo " "
echo "Installation has been completed!!"
echo " "
echo "=========================[SCRIPT PREMIUM]========================"
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI SSH ]" | tee -a log-install.txt
echo "    -------------------------" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - Stunnel4                : 447, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80"  | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI  Badvpn, Nginx]" | tee -a log-install.txt
echo "    ---------------------------" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Shadowsocks-R & Shadowsocks]"  | tee -a log-install.txt
echo "    ---------------------------------------" | tee -a log-install.txt
echo "   - Websocket Shadowsocks   : 443"  | tee -a log-install.txt
echo "   - Shadowsocks GRPC        : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ----------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 80"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI TROJAN]"  | tee -a log-install.txt
echo "    ------------------" | tee -a log-install.txt
echo "   - Websocket Trojan        : 443"  | tee -a log-install.txt
echo "   - Trojan GRPC             : 443"  | tee -a log-install.txt
echo "   --------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Auto Reboot On           : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - Custom Path " | tee -a log-install.txt
echo "   - Auto Backup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully Automatic Script" | tee -a log-install.txt
echo "   - VPS Settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Backup & Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=========================[SCRIPT PREMIUM]========================"
echo ""
sleep 3
echo -e "    ${tyblue}.------------------------------------------.${NC}"
echo -e "    ${tyblue}|     SUCCESFULLY INSTALLED THE SCRIPT     |${NC}"
echo -e "    ${tyblue}'------------------------------------------'${NC}"

rm /root/cf.sh >/dev/null 2>&1
rm /root/setup.sh >/dev/null 2>&1
rm /root/insshws.sh 
rm /root/update.sh

echo ""
echo -e "Setting up autorefresh on xray user login"
#echo -ne "Choose between 1-30 minutes: "; read afresh
wget -q -O /usr/bin/clear-log raw.githubusercontent.com/LawNetwork/Autoscript/main/xray/clear-log
chmod +x /usr/bin/clear-log; cd
wget -q raw.githubusercontent.com/LawNetwork/Autoscript/main/addons/crontab.sh
chmod +x crontab.sh; ./crontab.sh; rm crontab.sh

echo "#!/bin/bash" > /usr/bin/regionchecker
echo "bash <(curl -L -s https://s.id/netflixchecker) -E -M 4" >> /usr/bin/regionchecker
chmod +x /usr/bin/regionchecker

echo ""
echo -e "   ${tyblue}Your VPS Will Be Automatical Reboot In 10 seconds${NC}"

sleep 10
reboot
