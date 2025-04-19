#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

DEV_ROOT=`pwd`
ln -s $DEV_ROOT/dotfiles/.tmux.conf ~
mkdir -p ~/.ssh

ln -s $DEV_ROOT/dotfiles/.vimrc ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
