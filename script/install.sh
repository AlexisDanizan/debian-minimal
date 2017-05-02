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
#cp ./kernel/linux-headers-4.9.6_3.alexis_amd64.deb $DIR
#cp ./kernel/linux-image-4.9.6_3.alexis_amd64.deb $DIR
#cp ./chroot.sh $DIR
#cp ./busybox-x86_64 $DIR
#chmod +x $DIR/chroot.sh $DIR/busybox-x86_64
chroot $DIR /bin/bash
#chroot $DIR  ./chroot.sh
sleep 5
umount $DIR/{dev,proc} ; umount $DIR
#delete last line fstabe
nano /etc/fstab
echo "Finish install"
