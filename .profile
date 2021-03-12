#!/bin/sh

# Profile file. Runs on login. Environmental variables are set here.

export PATH="$PATH:$HOME/.local/bin:$HOME/py:$HOME/.local/usr/local/bin:$HOME/.local/usr/bin"

# Default programs:
export EDITOR="nvim"
export TERMINAL="xterm"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"

# ~/ Clean-up:
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/inputrc"

# Other program settings:
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

export WINDOWS='/mnt/windows'
export BAT_THEME="Dracula"

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx


