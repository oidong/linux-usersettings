#!/bin/sh

VIM_VERSION=`vim --version | head -n1 | cut -d ' ' -f 5 | tr -d .`
VIM_PATH='/usr/share/vim/vim'${VIM_VERSION}

cp bashrc/root_bashrc /root/.bashrc
cp bashrc/user_bashrc /etc/skel/.bashrc

echo 'set mouse=' >> /etc/vimrc
echo 'filetype plugin on' >> /etc/vimrc
echo 'syntax on' >> /etc/vimrc
echo 'set number' >> /etc/vimrc

cp vim-plugins/*.vim ${VIM_PATH}/plugin/

echo 'caption always "%{rw} * | %H * $LOGNAME | %{bw}%c %D | %{-}%-Lw%{rw}%50>%{rW}%n%f* %t %{-}%+Lw%<"' >> /etc/screenrc
