dd if=/dev/sdb conv=sync,noerror bs=64K | gzip -c -9  > ./backup.img.gz
