#!/usr/bin/env bash

# Franklin Souza
# @FranklinTech

#Criação de pastas
i3PATH(){
  clear
  mkdir $HOME/.frannks-mydots
  mkdir $HOME/.compile
  mkdir $HOME/.config/rofi
  mkdir $HOME/.config/rofi/themes
  mkdir $HOME/.config/polybar
  mkdir $HOME/.config/dunst
  mkdir $HOME/.config/nvim
  mkdir $HOME/.fonts
  mkdir $HOME/.themes
  mkdir $HOME/.icons
  mkdir $HOME/.local/bin
  mkdir $HOME/Scripts
  mkdir $HOME/Wallpapers
  mkdir $HOME/.projects
  mkdir $HOME/.config/qutebrowser
}

# Instalação de pacotes
packages_install(){
  #clear && sudo pacman -S archlinux-keyring --noconfirm
  clear && sudo pacman -S arandr sxiv rustup scrot picom cronie polybar heimdall qutebrowser tmate meson htop unzip unrar zip p7zip nitrogen socat clamav thunderbird-i18n-pt-pt scrcpy dysk qbittorrent tor dunst fuse mpv libnotify pacman-contrib lxappearance gvfs-mtp xdg-user-dirs w3m ttf-fira-code zsh zsh-autosuggestions zsh-syntax-highlighting reflector ttf-font-awesome imagemagick inetutils bc base-devel wmctrl lsd yt-dlp bat net-tools polkit-gnome nodejs yarn fzf ueberzug dmenu man-db python-pywal wget pyenv python-pipx python-jedi python-pylint python-requests --noconfirm && xdg-user-dirs-update
  rustup default stable && clear
}

# Compilações - AUR
builds(){
  cd $HOME/.compile
  git clone https://aur.archlinux.org/i3-autolayout.git
  cd i3-autolayout
  makepkg -sic --noconfirm

  clear
  cd $HOME/.compile
  git clone https://aur.archlinux.org/wal-telegram-git.git
  cd wal-telegram-git
  makepkg -sic --noconfirm

  clear
  cd $HOME/.compile
  git clone https://aur.archlinux.org/i3lock-color.git
  cd $HOME/.compile/i3lock-color
  makepkg -sic --noconfirm

  #cd $HOME/.compile
  #git clone https://aur.archlinux.org/pulseaudio-ctl.git
  #cd pulseaudio-ctl
  #makepkg -sic --noconfirm

  clear
  cd $HOME/.projects
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
  echo 'source ~/.projects/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc

  clear
  cd $HOME/.projects
  git clone https://github.com/GideonWolfe/Zathura-Pywal.git
  cd Zathura-Pywal && chmod +x install.sh && ./install.sh

  clear
  cd $HOME/.frannks-mydots
  git clone https://github.com/frannks/mydots.git
}

# Copiando arquivos
copy_files(){
  clear && echo -e "[!] Copiando arquivos..." && sleep 2
  cp $HOME/.frannks-mydots/mydots/bin/* $HOME/.local/bin
  cd $HOME/.local/bin && wget -c "https://github.com/frannks/mydots/raw/main/bin/mastoot"
  cd $HOME/.local/bin && chmod +x *
  cp $HOME/.frannks-mydots/mydots/scripts/* $HOME/Scripts
  cd $HOME/Scripts && chmod +x *
  cd $HOME/Scripts
  wget -c "https://github.com/frannks/mydots/raw/main/scripts/short-url.py"

  cp $HOME/.frannks-mydots/mydots/fonts/* $HOME/.fonts
  cp $HOME/.frannks-mydots/mydots/home/.zshrc $HOME
  cp $HOME/.frannks-mydots/mydots/home/.zshenv $HOME
  cp $HOME/.frannks-mydots/mydots/home/.zprofile $HOME
  cp $HOME/.frannks-mydots/mydots/home/.aliases $HOME
  cp $HOME/.frannks-mydots/mydots/home/.scripts $HOME
  cp $HOME/.frannks-mydots/mydots/home/.emojis $HOME
  touch .zhistory $HOME
  sudo cp $HOME/.frannks-mydots/mydots/fonts/Iosevka-Medium.ttf /usr/share/fonts/TTF
  sudo cp $HOME/.frannks-mydots/mydots/fonts/Iosevka-Bold.ttf /usr/share/fonts/TTF
  sudo cp $HOME/.frannks-mydots/mydots/fonts/Poppins.otf /usr/share/fonts
  sudo cp $HOME/.frannks-mydots/mydots/fonts/MesloLGS NF Regular.ttf /usr/share/fonts/TTF
  sudo mv $HOME/.local/bin/snapshots-crontab /usr/bin
  sudo chmod +x /usr/bin/snapshots-crontab
}

# Finalizando o script
end_script(){
  cp $HOME/.frannks-mydots/mydots/.config/picom.conf $HOME/.config
  cp $HOME/.frannks-mydots/mydots/.config/starship.toml $HOME/.config
  cp $HOME/.frannks-mydots/mydots/.config/i3/config $HOME/.config/i3/
  cp -r $HOME/.frannks-mydots/mydots/.config/polybar/scripts $HOME/.config/polybar
  cp $HOME/.frannks-mydots/mydots/.config/polybar/config $HOME/.config/polybar
  chmod +x $HOME/.config/polybar/scripts/*
  sudo pacman -S rofi --noconfirm
  cp -r $HOME/.frannks-mydots/mydots/.config/qutebrowser/config.py $HOME/.config
  cp $HOME/.frannks-mydots/mydots/.config/rofi/drun.rasi $HOME/.config/rofi/
  cp $HOME/.frannks-mydots/mydots/.config/rofi/themes/dark.rasi $HOME/.config/rofi/themes/
  cp $HOME/.frannks-mydots/mydots/.config/kitty/kitty.conf $HOME/.config/kitty
  cp $HOME/.frannks-mydots/mydots/.config/kitty/theme.conf $HOME/.config/kitty
  cd $HOME/.config/rofi && wget -c "https://github.com/frannks/mydots/raw/main/.config/rofi/search_browser.sh" && chmod +x search_browser.sh
  sudo ln -sv /usr/bin/kitty /usr/bin/xterm
  cp $HOME/.frannks-mydots/mydots/.config/dunst/dunstrc $HOME/.config/dunst
  cp $HOME/.frannks-mydots/mydots/.config/dunst/launchdunst.sh $HOME/.config/dunst && chmod +x $HOME/.config/dunst/launchdunst.sh
  xdg-mime default org.pwmt.zathura.desktop application/pdf
  cp $HOME/.frannks-mydots/mydots/.config/nvim/init.vim $HOME/.config/nvim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  cp -r $HOME/.local/share/nvim/site/autoload $HOME/.config/nvim
  cp $HOME/.frannks-mydots/mydots/.config/qutebrowser/* $HOME/.config/qutebrowser && cd $HOME/.config/qutebrowser && pip install -r requirements.txt && cd $HOME

  mkdir $HOME/Downloads/qute_down

  clear && cd $HOME/Wallpapers
  wget -c "https://raw.githubusercontent.com/frannks/wallpapers/main/004.jpg"
  wal -i $HOME/Wallpapers/004.jpg
  sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji --noconfirm
  clear && cd $HOME && i3-msg restart
}

i3PATH
packages_install
builds
copy_files
end_script
