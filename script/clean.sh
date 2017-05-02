#!/bin/sh
apt list --installed
apt-get --purge remove perl vim-common whiptail nano tasksel
apt-get remove --purge initramfs-tools rsyslog wget traceroute busybox
apt-get --purge remove net-tools netcat-traditional logrotateap less iproute2 iptables
apt-get --purge remove bsdmainutils iputils-ping man-db manpages
apt-get autoremove
apt-get clean all
rm -rf /usr/src/linux-headers-4.9.6
rm -rf /usr/share/man/*
rm -rf /usr/share/doc/*
#locale a faire /usr/share/locale
./busybox-x86_64 --install /usr/bin

