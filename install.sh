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
apt-get -y install git-core vim-nox tmux python-pip python-flake8 mutt tree 
git clone https://github.com/totor59/pocketchip
cd pocketchip

# POCKETCHIP SETTINGS
# Includes keymap for pocketchip and support for module rt2800usb
mv pocketchip.kmap /home/chip/.config/
rm /etc/rc.local
cp rc.local /etc/
rm /etc/modules
cp modules /etc/modules
cp battery /usr/bin/battery
chmod 755 battery
chmod +x motd.sh
rm /etc/motd
cp motd.sh /etc/profile.d/

# GIT
mv gitconfig /home/chip/.gitconfig

# VIM
chmod -R 777 /etc/vim
mkdir bundle
rm /etc/vim/vimrc
mv vimrc /etc/vim/
mkdir /etc/vim/bundle
source /etc/vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git /etc/vim/bundle/Vundle.vim
vim +PluginInstall +qall

# TMUX
cp tmux.conf /home/chip/.tmux.conf

