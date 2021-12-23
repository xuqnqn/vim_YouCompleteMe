# Install vim with YouCompleteMe


## 准备工作
- 安装ubuntu18.04
- sudo apt-get install gcc make perl git
- 安装virtual box addtions

## 安装本vim配置文件
- copy this folder to ~/.vim
- run the following command:
  sudo ./install.sh
- in each source file folder, can run "source_insght.sh" to generate cscope files. "source_insight.sh clean" to clean cscope files.
- gvim source file, it will auto load cscope file.

## 安装依赖包：
- sudo apt-get install libncurses5-dev libncursesw5-dev
- sudo apt install build-essential cmake python3-dev 
- sudo apt-get install libgtk-3-dev
- sudo apt-get install libxt-dev  

- sudo apt-get install g++-8
- sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
- sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

- mkdir bin/vim bin/cmake -p
 

## 编译安装cmake 3.14
- git clone https://github.com/Kitware/CMake.git
- git tag
- git checkout v3.14.0
- make distclean
- ./configure --prefix=/home/xuqnqn/bin/cmake
- make
- make install


## 编译安装gvim 8.1:
- git clone https://github.com/vim/vim.git
- git tag 
- git checkout v8.1.2309
- ./configure --enable-pythoninterp=yes --enable-cscope --enable-fontset --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu --enable-python3interp=yes --with-python3-command=python3.6 --prefix=/home/xuqnqn/bin/vim ./configure --enable-pythoninterp=yes --enable-cscope --enable-fontset --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu --enable-python3interp=yes --with-python3-command=python3.6 --prefix=/home/xuqnqn/bin/vim --with-features=huge --enable-luainterp --with-x --enable-gui=gtk3  --with-features=huge --enable-xim  --enable-multibyte
- make
- make install


## 配置环境变量：
- export PATH=/home/xuqnqn/bin/vim/bin:$PATH
- export PATH=/home/xuqnqn/bin/cmake/bin:$PATH



## PluginInstall安装Vundle的插件
- 进入vim，输入冒号，执行PluginInstall 来安装由Vundle管理的插件


## 手动编译YouCompleteMe，编译方法参照如下：
- #git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
- cd ~/.vim/bundle/YouCompleteMe/third_party/
- git submodule update --init --recursive
- ./install.py --clang-completer		#编译，有可能会出错，然后进行下一步

- cd third_party/ycmd/clang_archives
- mv libclang-13.0.0-x86_64-unknown-linux-gnu.tar.bz2 old-libclang-13.0.0-x86_64-unknown-linux-gnu.tar.bz2
- wget https://github.com/ycm-core/llvm/releases/download/13.0.0/libclang-13.0.0-x86_64-unknown-linux-gnu.tar.bz2
- ./install.py --clang-completer		#重新编译

