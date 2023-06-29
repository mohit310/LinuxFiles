#!/bin/bash
new_version=6.3.10
new_full_version=linux-$new_version
file_name=${new_full_version}.tar.xz
if [ ! -f $file_name ]; then
    echo "Downloading kernel $new_version"
    major_version=`echo $new_version | cut -d'.' -f1`
    file_name=${new_full_version}.tar.xz
    echo $file_name
    full_path="https://cdn.kernel.org/pub/linux/kernel/v${major_version}.x/${file_name}"
    curl -O $full_path
    echo "Finished downloading $file_name"
    if [ ! -f "$file_name" ]; then
       echo "Linux file $file_name does not exist"
       exit 1   
    fi
    echo "extracting file"
    tar -xf $file_name
fi
symlink_point_to_dir=`readlink linux`
current_version=`echo $symlink_point_to_dir | cut -d'-' -f2`
if [ "$current_version" != "$new_version" ]; then
    echo "setting up linux link to $new_version from $current_version"
    rm -rf linux
    ln -sf $new_full_version linux
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
#scripts/config -e LTO_CLANG_FULL
#make LLVM=1 LLVM_IAS=1 CC=clang oldconfig
#make LLVM=1 LLVM_IAS=1 CC=clang -j16
#sudo make LLVM=1 LLVM_IAS=1 CC=clang -j16 modules_install 

make menuconfig
make -j14
sudo make -j16 modules_install 
echo "copying kernel"
sudo cp arch/x86_64/boot/bzImage /boot/vmlinuz-linux-mk
echo "initcpio"
sudo mkinitcpio -p linux-mk
echo "updating grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "finishing up..."
cd ../
echo "Alllll done.. Enjoy"
