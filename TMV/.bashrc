stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 0)\]\t \[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

###PERSONAL EDITS
alias cat='bat'
alias bat_pow='sudo upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias la='ls -A'
alias l='ls'
alias ll='ls -l'
alias display='sxiv'
alias xbacklight='sudo xbacklight'
export WINDOWS='/mnt/windows'
export PATH=$PATH:/home/mas/py/
alias nox='user_nox.py'
alias incendio='user_incendio.py'
alias imperio='sudo user_imperio.py'
export TERMINAL='xterm'
alias ipconfig='curl ipconfig.io'
alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias rmac='rmac.py'
export BAT_THEME="Dracula"

# append to the history instead of overwriting (good for multiple connections)
shopt -s histappend

# ignore duplicate commands, ignore commands starting with a space
export HISTCONTROL=erasedups

#reminder of what to do
cat /home/mas/TODO.leny
