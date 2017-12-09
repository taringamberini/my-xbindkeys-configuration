#!/bin/bash

INSTALL_DIR=xbindkeys-my-conf
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_DIR="$INSTALL_DIR-backup-$DATE"


echo "Checking for previous xbindkeys configuration"
if [ -f ~/.xbindkeysrc ] || [ -d ~/$INSTALL_DIR ]
then
    echo "You already have an existing xbindkeys configuration"
    echo -n "Trying to back it up in ~/$BACKUP_DIR ... "
    mv ~/.xbindkeysrc ~/$BACKUP_DIR
    mv ~/$INSTALL_DIR ~/$BACKUP_DIR
    echo "success"
fi


echo "Installing xbindkeys configuration in ~/$INSTALL_DIR"

echo "Cloning my xbindkeys configuration from GitHub in ~/$INSTALL_DIR"
git clone https://github.com/taringamberini/my-xbindkeys-configuration.git ~/$INSTALL_DIR

echo -n "Creating symlink ... "
ln -s ~/$INSTALL_DIR/xbindkeysrc ~/.xbindkeysrc
echo "success"

echo "xbindkeys installation completed :-)"

