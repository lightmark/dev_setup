#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

DEV_ROOT=`pwd`
ln -sb $DEV_ROOT/dotfiles/.tmux.conf ~
ln -sb $DEV_ROOT/dotfiles/.bash_profile ~
ln -sb $DEV_ROOT/dotfiles/.bashrc ~

if [ -d ~/.emacs.d/ ]; then
        mv ~/.emacs.d ~/.emacs.d~
fi
ln -sf $DEV_ROOT/.emacs.d ~

