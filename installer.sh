#!/bin/bash

apps=('zsh' 'vim' 'screen' 'ncmpcpp' 'conky')

cp bashrc/root_bashrc /root/.bashrc
cp bashrc/user_bashrc /etc/skel/.bashrc
echo "[*]Installed bash settings"

function configureSettingszsh {
	git clone git://github.com/robbyrussell/oh-my-zsh.git /etc/skel/.oh-my-zsh
	cp zsh/oidong.zsh /etc/skel/.oh-my-zsh/custom/oidong.zsh
	cp zsh/.zshrc /etc/skel/.zshrc
}

function configureSettingsvim {
	VIM_VERSION=`vim --version | head -n1 | cut -d ' ' -f 5 | tr -d .`
	VIM_PATH='/usr/share/vim/vim'${VIM_VERSION}

	echo 'color ron' >> /etc/vimrc
	echo 'set mouse=' >> /etc/vimrc
	echo 'filetype plugin on' >> /etc/vimrc
	echo 'syntax on' >> /etc/vimrc
	echo 'set number' >> /etc/vimrc
	echo 'autocmd FileType yaml setlocal ai ts=2 sw=2 et' >> /etc/vimrc

	cp vim-plugins/*.vim ${VIM_PATH}/plugin/
}

function configureSettingsscreen {
	echo 'caption always "%{RK}[%{yK}$LOGNAME%{R}@%{BK}%H%{RK}] %{-}%-Lw%{.RK.}%50>%{RK}%n%f* %t %{-}%+Lw%< %-=%{R}[%{c}%D %d %M %{BK}%c%{R}]%{d}"' >> /etc/screenrc
}

function configureSettingsncmpcpp {
	mkdir /etc/skel/.ncmpcpp
	cp ncmpcpp/config /etc/skel/.ncmpcpp/config
}

function configureSettingsconcy {
	mkdir -p /etc/skel/.config/conky
	cp conky/conky.conf /etc/skel/.config/conky/conky.conf
}

for app in ${apps[*]}
do
  echo "[*]Sarch for $app"
  which $app &> /dev/null
  if [ $? -eq 0 ]
  then
    echo "[*]Found $app... will install settings"
    configureSettings$app $app
    echo "[*]Installed $app settings"
  else
  	echo "[*]$app not found, skipping..."
  fi
done
