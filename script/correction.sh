#!/bin/bash
USB=/dev/sdb1
DIR=/mnt/usb
mkdir -p $DIR
echo "$USB $DIR ext4 defaults 0 0" >> /etc/fstab
umount $USB
mount $USB
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

# l'install
cp ./chroot.sh $DIR
cp ./clean.sh $DIR
cp ./busybox-x86_64 $DIR
chmod +x $DIR/chroot.sh $DIR/clean.sh $DIR/busybox-x86_64
chroot $DIR /bin/bash
sleep 5
umount $DIR/{dev,proc} ; umount $DIR
#delete last line fstabe
nano /etc/fstab
echo "Finish install"
