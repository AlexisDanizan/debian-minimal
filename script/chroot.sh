#!/bin/bash
echo "Change password root: "
passwd
#chsh -s /bin/ash
#nano /lib/systemd/system/lcddanizan.service
systemctl enable lcddanizan
#/etc/fstab
# BLKID
blkid
echo "Entre l\'UUID de la clé: "
read BID
echo "
proc /proc proc defaults
UUID=$BID    /    ext4 ro,errors=remount-ro 0 1
tmpfs /tmp tmpfs defaults,noatime,nosuid,nodev,noexec,mode=1777,size=5M 0 0
" > /etc/fstab

# Hostname
echo "Hostname: "
read HOST
echo "$HOST" > /etc/hostname

#Network
echo "
auto lo
iface lo inet loopback

allow-hotplug eth0
auto eth0
iface eth0 inet dhcp
" > /etc/network/interfaces

#Clavier
apt install console-data

# Le noyau
#apt-get install initramfs-tools grub2
#echo "selinux=0 console=tty1 quiet" >> /etc/default/grub
#nano /etc/default/grub
#dpkg -i linux-headers-4.9.6_3.alexis_amd64.deb
#dpkg -i linux-image-4.9.6_3.alexis_amd64.deb

# Le script de boot
nano /etc/init.d/lcdalexis
insserv lcdalexis

nano /etc/init.d/httpd
insserv httpd

#lcd4linux
apt-get install lcd4linux









#apt install locales 
#locale-gen "fr_FR.utf8"
#dpkg-reconfigure locales

#./busybox-x86_64 --install /usr/bin
#rcconf
#systemctl -l
#systemctl disable cron.service
#systemctl disable rsyslog.service
#apt list --installed
#apt-get remove --purge tasksel wget vim-common traceroute perl aptitude xdg-user-dirs iptables iproute2
#apt-get remove --purge net-tools netcat-traditional whiptail
#apt-get clean all

#apt-get --purge -f remove nano grep gzip sed less hostname login logrotate cron rsyslog passwd

#rm -r /var/lib/* /var/cache/*
# pas dpkg
#lcd project
#apt-get install lcd4linux


# recompile kenerl
## pre requis
#apt install git build-essential libncurses5-dev xz-utils kernel-package
# on supprime les doc
#apt remove texlive-latex-base-doc texlive-latex-recommended-doc texlive-latex-extra-doc texlive-pictures-doc texlive-pstricks-doc
# on prepare le dossier
#mkdir /kernel && cd /kernel
#wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.9.25.tar.xz
#tar xvf linux-4.9.25.tar.xz
#cd linux-4.9.25

# on copie la config actuelle
#cp /boot/config-$(uname -r) .config
#make menuconfig

#compilation
#make-kpkg clean
#make-kpkg --initrd --revision=1.CZS kernel_image kernel_headers



#http://unix.stackexchange.com/questions/265014/how-to-start-a-script-on-tty-instead-of-asking-for-login-in-systemd

# Remove unused package
#apt list --installed
#apt remove --purge acl adduser busybox cron gnupg iptables wget
# LOG
#rm /etc/rc0.d/K03rsyslog
#rm /etc/rc1.d/K03rsyslog
#rm /etc/rc2.d/K03rsyslog
#rm /etc/rc3.d/K03rsyslog
#rm /etc/rc4.d/K03rsyslog
#rm /etc/rc5.d/K03rsyslog

#rm /etc/rc1.d/S01bootlogs
#rm /etc/rc2.d/S01bootlogs
#rm /etc/rc3.d/S01bootlogs
#rm /etc/rc4.d/S01bootlogs
#rm /etc/rc5.d/S01bootlogs

# motd ??

# CRON
#rm /etc/rc2.d/S02cron
#rm /etc/rc3.d/S02cron
#rm /etc/rc4.d/S02cron
#rm /etc/rc5.d/S02cron
