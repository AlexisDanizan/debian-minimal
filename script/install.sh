#!/bin/bash
USB=/dev/sdb1
DIR=/mnt/usb
#mkfs.ext4 $USB
#mkdir -p $DIR
echo "$USB $DIR ext4 defaults 0 0" >> /etc/fstab
umount $USB
mount $USB
#debootstrap stable $DIR http://deb.debian.org/debian/
mount -t proc none $DIR/proc
mount -o bind /dev $DIR/dev
# Les scripts CGI
mkdir $DIR/www
cp -R ../www/* $DIR/www
# Le script de boot
cp lcdalexis $DIR/etc/init.d/lcdalexis
chmod +x $DIR/etc/init.d/lcdalexis

cp httpd $DIR/etc/init.d/httpd
chmod +x $DIR/etc/init.d/httpd

#Le kernel
#cp ./kernel/linux-headers-4.9.6_3.alexis_amd64.deb $DIR
#cp ./kernel/linux-image-4.9.6_3.alexis_amd64.deb $DIR
# l'install
cp ./chroot.sh $DIR
cp ./busybox-x86_64 $DIR
chmod +x $DIR/chroot.sh $DIR/busybox-x86_64
#chroot $DIR /bin/bash
#chroot $DIR  ./chroot.sh
chroot $DIR /bin/bash
sleep 5
umount $DIR/{dev,proc} ; umount $DIR
#delete last line fstabe
nano /etc/fstab
echo "Finish install"
