#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);

apt install rclone -y
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/LawVPN/SSH-XRAY/main/data/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user bckupvpns@gmail.com
from bckupvpns@gmail.com
password Yangbaru1Yangbaru1cuj
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/backup.sh"
wget -O restore "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/restore.sh"
wget -O limitspeed "https://raw.githubusercontent.com/Ilhamstoress/SSH-XRAY/main/data/limitspeed.sh"
chmod +x autobackup
chmod +x backup
chmod +x restore
chmod +x limitspeed
cd
rm -f /root/set-br.sh
