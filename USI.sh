#!/bin/bash
#setup time zone
sudo timedatectl set-timezone America/New_York
sudo systemctl enable systemd-timesyncd

~/.files/update.sh
#Installs archiving/compreshion Pacages
sudo apt install p7zip unrar tar rsync zstd 
#Installs basic pacages
sudo apt install curl wget nano neovim
#Installs zsh
sudo apt install zsh && chsh -s /bin/zsh && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "#Bob
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG50sgvTSDclHBXiGljCwo9NWfM411U6f12Xog0nt6Bw BOB
#Vcode
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID0J5BnE39FsLimpAAvbrZI4xfGM5Si0UOpTsDwOfITh Vcode
#Phone
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJDhddiEwi77eNYLYPJhfP/VZaUqezTNvxIwh0dV2SS JuiceSSH" >> ~/.ssh/authorized_keys


#Links zsh and vim rc files
ln -fs ~/.files/vimrc ~/.vimrc
ln -fs ~/.files/zshrc ~/.zshrc

if [[ $1 == alice ]]; then
  
  groupadd alice
  useradd -m -g alice -G users -G sudo alice
  chsh -s /bin/zsh alice
  mkdir /home/alice/.ssh/ && echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILWG3cIBju6vzX6s8JlmGNJOiWY7pQ19bHvcqDADtWzv snowi@DESKTOP-EVIR8IH" > /home/alice/.ssh/authorized_keys

fi