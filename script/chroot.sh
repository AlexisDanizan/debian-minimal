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
# personnalisation
echo "Alexis Danizan Debian minimal full fonctionnal (JESSIE/minimal Kernel)
	\n \l
	WELCOME BRO !" > /etc/issue
# Le noyau
apt-get install initramfs-tools grub2
echo "selinux=0 console=tty1 quiet" >> /etc/default/grub
nano /etc/default/grub
dpkg -i linux-headers-4.9.6_3.alexis_amd64.deb
dpkg -i linux-image-4.9.6_3.alexis_amd64.deb

# Le script de boot
nano /etc/init.d/httpd
insserv httpd

#lcd4linux
apt-get install lcd4linux

./clean.sh


