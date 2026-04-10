#!/bin/bash

# for dev!

rm -rf parrotlinux.iso # clear the old ISO
cd fs
find . | cpio -o -H newc > ../init.cpio
cd ..
ls -lh init.cpio
cd linux
make isoimage FDINITRD=../init.cpio FDARGS="initrd=/init.cpio" 
cd ..
mv linux/arch/x86/boot/image.iso parrotlinux.iso
echo "build is done! find at parrotlinux.iso"
