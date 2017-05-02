#!/bin/bash
sudo apt install git build-essential libncurses5-dev xz-utils kernel-package
rm -rf kernel
mkdir kernel && cd ./kernel
#git clone https://anonscm.debian.org/git/kernel/linux.git
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.9.6.tar.xz
tar xf linux-4.9.6.tar.xz
cd linux-4.9.6
#make tinyconfig
#cp /boot/config-$(uname -r) .config
cp ../../.config .config
make menuconfig
make-kpkg clean
fakeroot make-kpkg --initrd --revision=1.alexis kernel_image kernel_headers --jobs 4
#fakeroot make -j5 deb-pkg LOCALVERSION=-alexis KDEB_PKGVERSION=1

#dpkg -i linux-image-4.10*
#dpkg -i linux-headers-4.10*
#grub-mkconfig
