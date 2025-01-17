#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/yudhynetwork/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m" 
export COLOR1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Remove Old Script"
rm /usr/bin/menu-bot

sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Downloading New Script"

wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-bot.sh" && chmod +x /usr/bin/menu-bot
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -q -O /usr/bin/menu-theme "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-theme.sh" && chmod +x /usr/bin/menu-theme
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -O /usr/bin/menu-ip "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-ip.sh" && chmod +x /usr/bin/menu-ip
wget -q -O /usr/bin/menu-tor "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-tor.sh" && chmod +x /usr/bin/menu-tor
wget -q -O /usr/bin/autoboot "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/autoboot.sh" && chmod +x /usr/bin/autoboot
wget -q -O /usr/bin/menu-tcp "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-tcp.sh" && chmod +x /usr/bin/menu-tcp
wget -q -O /usr/bin/rebootvps "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/rebootvps.sh" && chmod +x /usr/bin/rebootvps
wget -q -O /usr/bin/menu-dns "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-dns.sh" && chmod +x /usr/bin/menu-dns
wget -q -O /usr/bin/info "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/info.sh" && chmod +x /usr/bin/info
wget -q -O /usr/bin/mspeed "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-speedtest.sh" && chmod +x /usr/bin/mspeed
wget -q -O /usr/bin/mbandwith "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/menu-bandwith.sh" && chmod +x /usr/bin/mbandwith
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/update.sh" && chmod +x /usr/bin/update
echo -e " [INFO] Update Successfully"
wget -q -O /opt/.ver "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/version"

sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Download Changelog File"
wget -q -O /root/changelog.txt "https://raw.githubusercontent.com/LawVPN/SSH-XRAY/main/data/changelog.txt" && chmod +x /root/changelog.txt
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Read Changelog? do \"cat /root/changelog.txt\""
sleep 2
