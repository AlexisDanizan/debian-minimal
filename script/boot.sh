#!/bin/bash
qemu-system-x86_64 -netdev user,id=mynet0 -device rtl8139,netdev=mynet0 -m 200 /dev/sdb
#qemu-system-i386 -hda /dev/sdb
#qemu-x86_64 -hda /dev/sdb
