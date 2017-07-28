#!/bin/bash
###############################################################################
# POCKETCHIP CONFIGURATION
# 2017 totor59 <victormarechal59@gmail.com>
# You have to run as root
###############################################################################


# GENERAL
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y install vim-nox tmux python-pip python-flake8 mutt tree bash-completion dosbox firmware-ralink gcc make libx11-dev libxft-dev libxext-dev

# POCKETCHIP SETTINGS
# Includes keymap for pocketchip and support for module rt2800usb
mv pocketchip.kmap /home/chip/.config/
rm /etc/rc.local
cp rc.local /etc/
rm /etc/modules
cp modules /etc/modules
cp battery /usr/bin/battery
chmod 755 battery

# LIGHTWEIGHT TERMINAL
git clone git://git.suckless.org/st
cd st
make clean install
cd ..

# GIT
mv gitconfig /home/chip/.gitconfig

# TMUX
cp tmux.conf /home/chip/.tmux.conf

# DOSBOX
mkdir /home/chip/dos
mv dosbox-0.74.conf ~/home/chip/.dosbox-0.74.conf

# DESKTOP
mv icons/* /usr/share/pocket-home/appIcons/

# VIM
chmod -R 777 /etc/vim
mkdir bundle
rm /etc/vim/vimrc
mv vimrc /etc/vim/
mkdir /etc/vim/bundle
source /etc/vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git /etc/vim/bundle/Vundle.vim
vim +PluginInstall +qall
