#!/bin/bash
sudo apt install git build-essential libncurses5-dev xz-utils kernel-package
rm -rf kernel
mkdir kernel && cd ./kernel
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.9.6.tar.xz
tar xf linux-4.9.6.tar.xz
cd linux-4.9.6
cp ../../.CONFIG_KERNEL .config
make menuconfig
make-kpkg clean
fakeroot make-kpkg --initrd --revision=1.alexis kernel_image kernel_headers --jobs 4
