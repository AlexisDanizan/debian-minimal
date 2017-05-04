#!/bin/sh
apt list --installed
apt-get --purge remove perl vim-common whiptail nano tasksel
apt-get remove --purge initramfs-tools rsyslog wget traceroute busybox
apt-get --purge remove net-tools netcat-traditional logrotateap less iproute2 iptables
apt-get --purge remove bsdmainutils iputils-ping man-db manpages
apt-get --purge remove cron
apt-get autoremove
apt-get clean all
apt-get --purge remove cron logrotate
apt-get clean all

rm -rf /usr/src/linux-headers-4.9.6
rm -rf /usr/share/man/*
rm -rf /usr/share/doc/*
rm -rf /var/cache/*
rm -rf /var/log/*
rm -rf /usr/share/local/[a-df-z]*
rm -rf /var/lib/apt/lists/*
rm -rf /usr/share/info/*

#ls /etc/rc*.d
update-rc.d lcd4linux remove
update-rc.d mountnfs remove
systemctl disable mountnfs
systemctl disable lcd4linux.service
#locale a faire /usr/share/locale
mkdir /busybox
./busybox-x86_64 --install /busybox


ln -snf /busybox/dnsdomainname  /bin/dnsdomainname
ln -snf /busybox/cat /bin/cat     
ln -snf /busybox/echo /bin/echo	     
ln -snf /busybox/zcat /bin/zcat
ln -snf /busybox/sh /bin/sh
ln -snf /busybox/chvt /bin/chvt 
ln -snf /busybox/cp /bin/cp
ln -snf /busybox/sleep /bin/sleep	
ln -snf /busybox/ls /bin/ls
ln -snf /busybox/touch /bin/touch	
ln -snf /busybox/sh /bin/dash 
ln -snf /busybox/date /bin/date
ln -snf /busybox/pwd /bin/pwd	
ln -snf /busybox/hostname /bin/hostname 


ln -snf /busybox/sha1sum  /usr/bin/sha1sum
ln -snf /busybox/md5sum  /usr/bin/md5sum                  
ln -snf /busybox/sha256sum  /usr/bin/sha256sum
ln -snf /busybox/sha512sum  /usr/bin/sha512sum
ln -snf /busybox/clear  /usr/bin/clear 
ln -snf /busybox/tail  /usr/bin/tail
ln -snf /busybox/pgrep  /usr/bin/pgrep
ln -snf /busybox/top  /usr/bin/top
ln -snf /busybox/touch  /usr/bin/touch
ln -snf /busybox/vi  /usr/bin/vi
ln -snf /busybox/wget  /usr/bin/wget
ln -snf /busybox/who  /usr/bin/who
ln -snf /busybox/whoami  /usr/bin/whoami
ln -snf /busybox/xargs  /usr/bin/xargs


ln -snf /busybox/chvt  /usr/sbin/chvt
ln -snf /busybox/pgrep  /usr/sbin/pgrep                     
ln -snf /busybox/xargs  /usr/sbin/xargs
ln -snf /busybox/httpd /usr/sbin/httpd
# utils
ln -snf /busybox/arp  /bin/arp
ln -snf /busybox/arping  /bin/arping
ln -snf /busybox/ftpd  /bin/ftpd
ln -snf /busybox/ftpget  /bin/ftpget
ln -snf /busybox/ftpput  /bin/ftpput
ln -snf /busybox/ifconfig  /bin/ifconfig
ln -snf /busybox/ifdown  /bin/ifdown
ln -snf /busybox/ifenslave  /bin/ifenslave
ln -snf /busybox/ifplugd  /bin/ifplugd
ln -snf /busybox/ifup  /bin/ifup
ln -snf /busybox/ip  /bin/ip
ln -snf /busybox/ipaddr  /bin/ipaddr
ln -snf /busybox/ipcalc  /bin/ipcalc
ln -snf /busybox/ipcrm  /bin/ipcrm 
ln -snf /busybox/ipcs  /bin/ipcs
ln -snf /busybox/iplink  /bin/iplink
ln -snf /busybox/iproute  /bin/iproute
ln -snf /busybox/iprule  /bin/iprule
ln -snf /busybox/iptunnel  /bin/iptunnel
ln -snf /busybox/nc  /bin/nc
ln -snf /busybox/netstat  /bin/netstat
ln -snf /busybox/nslookup  /bin/nslookup
ln -snf /busybox/ping  /bin/ping
ln -snf /busybox/ping6  /bin/ping6
ln -snf /busybox/route  /bin/route
ln -snf /busybox/telnet  /bin/telnet
ln -snf /busybox/telnetd  /bin/telnetd
ln -snf /busybox/tftp  /bin/tftp
ln -snf /busybox/tftpd  /bin/tftpd
ln -snf /busybox/traceroute  /bin/traceroute
ln -snf /busybox/wget  /bin/wget

rm -f /root/.bash_history
rm -f /chroot.sh
rm -f /*.deb
rm -f /busybox-x86_64 
rm -f clean.sh
