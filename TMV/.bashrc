stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 0)\]\t \[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

###PERSONAL EDITS
export WINDOWS='/mnt/windows'
export PATH=$PATH:/home/mas/py/
export TERMINAL='xterm'
export BAT_THEME="Dracula"

# append to the history instead of overwriting (good for multiple connections)
shopt -s histappend

# ignore duplicate commands, ignore commands starting with a space
export HISTCONTROL=erasedups

#reminder of what to do
cat /home/mas/TODO.leny
