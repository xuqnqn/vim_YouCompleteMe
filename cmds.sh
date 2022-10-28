#!/bin/bash

  sudo apt install vim-gtk3
  sudo apt  install tree  # version 1.8.0-1
  sudo apt-get install make
  sudo apt-get install ninja-build
  sudo apt-get install gcc
  sudo apt-get install libglib2.0-dev
  sudo apt install -y libcap-ng-dev libattr1-dev
  sudo apt install -y libpixman-1-dev
  sudo apt install gitk
  sudo apt-get install flex
  sudo apt-get install bison
  sudo apt-get install libncurses-dev
  sudo apt-get install libelf-dev
  sudo apt-get install libssl-dev
  sudo apt-get install nfs-kernel-server
  sudo apt install cmake
  sudo apt-get install vnc4server


  #彻底卸载一个apt安装包的方法
  sudo apt-get --purge remove kexec-tools



  #kexec 在真机ubuntu上还是不好用，用qemu + kernel + 静态编译的kexec, makedumpfile实现了/proc/vmcore的生成和dumpcore文件的获取
  #下面是在ubuntu上没试成功的几个命令
  sudo kexec -p /boot/vmlinuz-`uname -r` --initrd=/boot/initrd.img-`uname -r` --reuse-cmdline
  kexec -p --command-line="BOOT_IMAGE=/boot/vmlinuz-5.15.0-52-generic root=UUID=01e5784b-3316-4af5-b3bf-708bd6086077 ro crashkernel=128M" --initrd=/boot/initrd.img-5.15.0-52-generic /boot/vmlinuz-5.15.0-52-generic
  cat /sys/kernel/kexec_crash_loaded
  sudo su
  echo 1 > /proc/sys/kernel/sysrq
  echo c > /proc/sysrq-trigger

  #下面试在qemu上成功的几个命令：
  /mnt/kexec -p /mnt/bzImage --initrd=/mnt/initramfs.cpio.gz 
  echo c > /proc/sysrq-trigger
  /mnt/makedumpfile -l --message-level 1 -d 31 /proc/vmcore makedumpfilecore





  #synaptic是挺好的包管理工具
  sudo apt install synaptic
  sudo apt install autoconf


  #makedumpfile默认是静态编译的，需要elfutils的一些头文件和静态库，还需要下面一些库，可以apt安装
  sudo apt-cache search lzma | grep dev

  sudo apt-get install libbz2-dev
  sudo apt-get install liblzma-dev



  #make elfutils-0.144
  #出现“-Wxxxx-xxx”的警告问题, 使用“-Wno-Wxxxx-xxx”解决, 继续编译
  make CFLAGS='-Wno-missing-attributes -Wno-implicit-fallthrough -Wno-nonnull-compare -Wno-unused-but-set-variable -Wno-implicit-function-declaration -Wno-sizeof-array-argument -Wno-sizeof-pointer-memaccess'
  #虽然没有完全编译成功，但是需要的.a库文件已经编译出来了，拷过去就行了

  sudo mkdir /usr/local/include/elfutils/
  sudo cp ./libdw/libdw.h   /usr/local/include/elfutils/libdw.h
  sudo cp ./libdwfl/libdwfl.h /usr/local/include/elfutils/libdwfl.h
  sudo cp ./libdw/dwarf.h   /usr/local/include/dwarf.h
  sudo cp ./libelf/libelf.h /usr/local/include/libelf.h
  sudo cp ./libelf/gelf.h   /usr/local/include/gelf.h
  
  sudo cp ./libelf/libelf.a /usr/local/lib/libelf.a
  sudo cp ./libdw/libdw.a   /usr/local/lib/libdw.a
  sudo cp ./libasm/libasm.a /usr/local/lib/libasm.a
  sudo cp ./libebl/libebl.a /usr/local/lib/libebl.a
