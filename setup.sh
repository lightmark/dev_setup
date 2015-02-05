#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

ln -sb dotfiles/.tmux.conf .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sf dotfiles/.emacs.d .
