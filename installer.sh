#!/bin/bash

apps=('zsh' 'vim' 'screen' 'ncmpcpp')

cp bashrc/root_bashrc /root/.bashrc
cp bashrc/user_bashrc /etc/skel/.bashrc
echo "[*]Installed bash settings"

function configureSettingszsh {
	git clone git://github.com/robbyrussell/oh-my-zsh.git /etc/skel/.oh-my-zsh
	cp zsh/oidong.zsh /etc/skel/.oh-my-zsh/custom/oidong.zsh
	cp zsh/.zshrc /etc/skel/.zshrc
	echo "[*]Installed $app settings"
}

function configureSettingsvim {
	VIM_VERSION=`vim --version | head -n1 | cut -d ' ' -f 5 | tr -d .`
	VIM_PATH='/usr/share/vim/vim'${VIM_VERSION}

	echo 'set mouse=' >> /etc/vimrc
	echo 'filetype plugin on' >> /etc/vimrc
	echo 'syntax on' >> /etc/vimrc
	echo 'set number' >> /etc/vimrc

	cp vim-plugins/*.vim ${VIM_PATH}/plugin/
	echo "[*]Installed $app settings"
}

function configureSettingsscreen {
	echo 'caption always "%{rw} * | %H * $LOGNAME | %{bw}%c %D | %{-}%-Lw%{rw}%50>%{rW}%n%f* %t %{-}%+Lw%<"' >> /etc/screenrc
	echo "[*]Installed $app settings"
}

function configureSettingsncmpcpp {
	mkdir /etc/skel/.ncmpcpp
	cp ncmpcpp/config /etc/skel/.ncmpcpp/config
	echo "[*]Installed $app settings"
}

for app in ${apps[*]}
do
  echo "[*]Sarch for $app"
  which $app &> /dev/null
  if [ $? -eq 0 ]
  then
    echo "[*]Found $app... will install settings"
    configureSettings$app $app
  else
  	echo "[*]$app not found, skipping..."
  fi
done
