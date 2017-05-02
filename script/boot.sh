#!/bin/bash
qemu-system-x86_64 -netdev user,id=mynet0,net=192.168.0.0/24,dhcpstart=192.168.0.50 /dev/sdb
#qemu-system-i386 -hda /dev/sdb
#qemu-x86_64 -hda /dev/sdb
