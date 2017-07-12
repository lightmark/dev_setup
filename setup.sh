#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

DEV_ROOT=`pwd`
ln -s $DEV_ROOT/dotfiles/.tmux.conf ~
ln -s $DEV_ROOT/dotfiles/.bash_profile ~
ln -s $DEV_ROOT/dotfiles/.bashrc ~

ln -s $DEV_ROOT/dotfiles/.vimrc ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
