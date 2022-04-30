#!/bin/bash
sudo apt update && sudo apt upgrade

#Installs xfce4
sudo apt install xfce4 xfce4-goodies

#Installs archiving/compression packages
sudo apt install p7zip unrar tar rsync zstd 
#Installs basic packages
sudo apt install base-devel curl wget nano neovim
#Installs File system utilities
sudo apt install ntfs-3g nfs-common

#Installs File system utilities
sudo apt install bluez blueman
# sudo apt install bluez bluez-utils blueman pulseaudio-bluetooth 
# sudo systemctl enable bluetooth.service

#Installs Dev tools
sudo apt install cgdb nodejs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-src clippy rustfmt

# spotify 

#Installs basic gui packages
sudo apt install firefox vlc gparted
#Installs Nemo and extensions
sudo apt install nemo nemo-fileroller
#Installs communication packages
sudo apt install discord telegram-desktop

# signal-desktop
# Ofisal instructions
# wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
# cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
# echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
# sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
# sudo apt update && sudo apt install signal-desktop

#Sets up syncthing
sudo apt install syncthing
systemctl enable syncthing@r2r0m0c0.service --now

#Sets up zerotier
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then 
	echo "$z" | sudo bash;
fi
sudo zerotier-cli join 35c192ce9beac38f

#Installs zsh
sudo apt install zsh && chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Links zshrc and vimrc
ln -fs ~/.files/vimrc ~/.vimrc
ln -fs ~/.files/zshrc ~/.zshrc

mkdir ~/.icons
mkdir ~/.theams
git clone https://github.com/EliverLara/candy-icons.git ~/.icons/candy-icons
git clone -b nova https://github.com/EliverLara/Sweet.git ~/.themes/Sweet-nova

gtk-update-icon-cache ~/.icons/candy-icons 
gsettings set org.gnome.desktop.interface gtk-theme "Sweet-nova"
gsettings set org.gnome.desktop.wm.preferences theme "Sweet-nova"

