#!/usr/bin/env bash

# Have a random quote inside cowsay
# fortune -s | cowsay -f elephant

# Set EDITOR to Neovim
export EDITOR=nvim

# Add pkgconfig info for pdftools
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# Change history command format
export HISTTIMEFORMAT='%m/%d/%y %T $ '

# Add fuckit
eval $(thefuck --alias)

# Add autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Activate vi mode with <Esc>
set -o vi

# Helpful aliases
alias ls='lsd'
alias doom="~/.emacs.d/bin/doom"

eval "$(fasd --init auto)"
