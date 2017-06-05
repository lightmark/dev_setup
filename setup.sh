#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

DEV_ROOT=`pwd`
ln -sb $DEV_ROOT/dotfiles/.tmux.conf ~
ln -sb $DEV_ROOT/dotfiles/.bash_profile ~
ln -sb $DEV_ROOT/dotfiles/.bashrc ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sb $DEV_ROOT/dotfiles/.vimrc ~
