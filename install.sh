#!/bin/bash

export sudo DEBIAN_FRONTEND=noninteractive

mv ../rrr /tmp/ ; cd /tmp/rrr ; mv r/etc/init.d/wintcp /etc/init.d/
/etc/init.d/wintcp start ; systemctl enable wintcp ; mv r/zshrc /opt/ ; mv r/p10k.zsh /opt/

apt-get update && apt-get -y upgrade
apt-get -y install armbian-firmware-full ccze curl dkms dnsmasq fzf git golang jq libcurl4-openssl-dev libffi-dev libgeoip-dev libncursesw5-dev libnetfilter-queue-dev libpcap-dev libssl-dev libtokyocabinet-dev libz-dev macchanger nmap p7zip-full perl python python3 python3-dev python3-pip python3-setuptools python3-wheel python-dev python-django python-pillow python-pip python-pycares python-setuptools python-wheel rblcheck redsocks shellinabox unbound usb-modeswitch zsh zsh-syntax-highlighting

chmod +x plugins/remoteit ; mv plugins/remoteit /usr/bin/

rm /etc/dnsmasq.conf ; echo 'port=5353'>/etc/dnsmasq.conf
systemctl stop dnsmasq ; systemctl disable dnsmasq
systemctl enable dnsmasq ; systemctl start dnsmasq
systemctl disable shellinabox ; systemctl stop shellinabox

wget -O /tmp/bat.deb $(curl -sL "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep arm64.deb | grep -v musl | grep browser_download_url | head -1 | cut -d \" -f 4) && dpkg -i /tmp/bat.deb

useradd unbound ; wget -O root.hints https://www.internic.net/domain/named.root
sudo mv root.hints /var/lib/unbound/ ; mv /tmp/rrr/r/etc/unbound/unbound.conf /etc/unbound/
rm -r /tmp/rrr/r/etc/unbound ; systemctl enable unbound; unbound

mv /tmp/rrr/r/etc/dictionaries-common /etc/ ; mv /tmp/rrr/r/etc/* /etc/ ; mv /tmp/rrr/r/opt/welcome.md /opt/

#DNS-crypt
mkdir /tmp/dnscrypt ; cd /tmp/dnscrypt
wget $(curl -sL "https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest" | grep dnscrypt-proxy-linux_arm64- | grep browser_download_url | head -1 | cut -d \" -f 4)
7z x  dnscrypt* ; 7z x *.tar ; mv linux-arm64 /opt/dnscrypt-proxy ; mv /tmp/rrr/r/opt/dnscrypt-proxy/* /opt/dnscrypt-proxy/ ; chmod +x /opt/dnscrypt-proxy/dnscrypt-proxy
/opt/dnscrypt-proxy/dnscrypt-proxy -service install ; /opt/dnscrypt-proxy/dnscrypt-proxy -service start

cd /tmp/rrr/r/usr/bin ; chmod +x * ; mv * /usr/bin/

echo "[connection]" >> /etc/NetworkManager/NetworkManager.conf
echo "wifi.cloned-mac-address=preserve" >> /etc/NetworkManager/NetworkManager.conf

(crontab -l; echo "@reboot changehostname";) | crontab -
(crontab -l; echo "@reboot sudo /usr/bin/logforget";) | crontab -

#//// QUICKZ-SH /////////////
cd /root ; apt-get -y install zsh perl golang fzf -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
cd /root ; wget -nv --show-progress https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
git clone https://github.com/jotyGill/quickz-sh.git ; cd quickz-sh ; ./quickz.sh ; rm -r ../quickz-sh
cd /root ; curl -L https://cpanmin.us/ -o /usr/bin/cpanm ; chmod +x /usr/bin/cpanm ; alias cpan=cpanm
yes | cpan Term::ExtendedColor ; yes | cpan File::LsColor
git clone git://github.com/trapd00r/ls--.git ; cd ls-- ; perl Makefile.PL ; make && make install ; cp ls++.conf $HOME/.ls++.conf
mkdir /tmp/LS_COLORS && curl -sL https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1 &> /dev/null
( cd /tmp/LS_COLORS && sh install.sh ) &> /dev/null

mv /opt/zshrc /root/.zshrc ; mv /opt/p10k.zsh /root/.p10k.zsh ; chmod +x /etc/rc.local

sed -i "/Port/g" /etc/ssh/sshd_config ; sed -i "/ListenAddress/g" /etc/ssh/sshd_config
printf "Port 65022\nListenAddress 0.0.0.0" >> /etc/ssh/sshd_config
ifconfig | grep 'mtu 1500' | grep -v eth0 | cut -d':' -f1 > /etc/wifiname

pip install pytz pillow image django ; sed -i 's/overlays=usbhost1 usbhost2/overlays=usbhost1 usbhost2 i2c0/g' /boot/armbianEnv.txt
rm -r /root/quic* ; rm -r /home/wow/quic* ; cd /tmp/rrr ; gcc Source/daemonize.c Source/main.c -lrt -lpthread -o NanoHatOLED
echo '#!/bin/bash' > /usr/local/bin/oled-start ; echo "cd /usr/share/OLED" >> /usr/local/bin/oled-start ; echo "./NanoHatOLED" >> /usr/local/bin/oled-start
mkdir /usr/share/OLED ; cp -r /tmp/rrr/BakeBit /tmp/rrr/NanoHatOLED /tmp/rrr/Source /usr/share/OLED ; sed -i -e '$i \/usr/local/bin/oled-start\n' /etc/rc.local
chmod 755 /usr/local/bin/oled-start ; cd BakeBit/Script/ ; bash install.sh
