if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Terminal Color
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

# Customize Prompt
#Prompt and prompt colors
export PS1="\[\e[37m\]\w\[\e[31;1m\] \$ \[\e[m\]"
export SUDO_PS1="\[\e[37;1;41m\][\u]\[\e[0m\] \[\e[33m\]\w \[\e[31m\]\$\[\e[0m\] "


export PATH="$HOME/.cargo/bin:$PATH"
