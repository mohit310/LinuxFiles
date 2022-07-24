#!/bin/bash
linux_version=linux-5.18.14
filename=${linux_version}.tar.xz
if [ ! -d linux ]; then
    echo "Downloading kernel $linux_version"
    curl -O https://cdn.kernel.org/pub/linux/kernel/v5.x/$filename
    echo "Finished downloading"
    if [ ! -f "$filename" ]; then
       echo "Linux file $filename does not exist"
       exit 1   
    fi
    echo "extracting file"
    tar -xf $filename
    echo "setting up linux link"
    ln -sf $linux_version linux
fi
echo "changing to linux dir"
cd linux
if [ ! -f ./.config ]; then
    echo "copying config"
    cp ../config ./.config
fi
patchfile="../kernel_compiler_patch/more-uarches-for-kernel-5.17+.patch"
patch -p1 -N --dry-run --silent < $patchfile 2>/dev/null
if [ $? -eq 0 ]; then
    echo "patching"
    patch -p1 < $patchfile
fi    
echo "making kernel"
scripts/config -e LTO_CLANG_FULL
make LLVM=1 LLVM_IAS=1 CC=clang oldconfig
make LLVM=1 LLVM_IAS=1 CC=clang -j16
sudo make LLVM=1 LLVM_IAS=1 CC=clang -j16 modules_install 

#make menuconfig
#make -j16
#sudo make -j16 modules_install 
echo "copying kernel"
sudo cp arch/x86_64/boot/bzImage /boot/vmlinuz-linux-mk
echo "initcpio"
sudo mkinitcpio -p linux-mk
echo "updating grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "finishing up..."
cd ../
echo "Alllll done.. Enjoy"
