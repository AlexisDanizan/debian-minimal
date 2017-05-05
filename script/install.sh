#!/bin/bash
USB=/dev/sdb1
DIR=/mnt/usb
mkfs.ext4 $USB
mkdir -p $DIR
echo "$USB $DIR ext4 defaults 0 0" >> /etc/fstab
umount $USB
mount $USB
# deboostrap
debootstrap stable $DIR http://deb.debian.org/debian/
mount -t proc none $DIR/proc
mount -o bind /dev $DIR/dev
# Les scripts CGI
mkdir $DIR/www
cp -R ../www/* $DIR/www
# test
cp ./testcgi.sh $DIR
chmod +x $DIR/testcgi.sh
# Le script de boot
cp ./lcddanizan.service $DIR/lib/systemd/system/
cp httpd $DIR/etc/init.d/httpd
chmod +x $DIR/etc/init.d/httpd

#Le kernel
cp ./kernel/linux-headers-4.9.6_3.alexis_amd64.deb $DIR
cp ./kernel/linux-image-4.9.6_3.alexis_amd64.deb $DIR
# l'install
cp ./chroot.sh $DIR
cp ./clean.sh $DIR
cp ./busybox-x86_64 $DIR
chmod +x $DIR/chroot.sh $DIR/clean.sh $DIR/busybox-x86_64
chroot $DIR  ./chroot.sh
sleep 5
cp ./lcd4linux.conf $DIR/etc/lcd4linux.conf
umount $DIR/{dev,proc} ; umount $DIR
#delete last line fstabe
nano /etc/fstab
echo "Finish install"
