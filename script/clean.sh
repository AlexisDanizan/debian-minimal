#!/bin/sh
apt list --installed
apt-get --purge remove perl vim-common whiptail nano tasksel
apt-get remove --purge initramfs-tools rsyslog wget traceroute busybox
apt-get --purge remove net-tools netcat-traditional logrotateap less iproute2 iptables
apt-get --purge remove bsdmainutils iputils-ping man-db manpages
apt-get --purge remove cron
apt-get autoremove
apt-get clean all
rm -rf /usr/src/linux-headers-4.9.6
rm -rf /usr/share/man/*
rm -rf /usr/share/doc/*
rm -rf /var/cache/*
rm -rf /var/log/*
rm -rf /usr/share/local/[a-df-z]*
rm -rf /var/lib/apt/lists/*
#ls /etc/rc*.d
update-rc.d lcd4linux remove
update-rc.d mountnfs remove
systemctl disable mountnfs
systemctl disable lcd4linux.service
#locale a faire /usr/share/locale
#./busybox-x86_64 --install /usr/bin
#pgrep, less, grep, less, vi, xargs
