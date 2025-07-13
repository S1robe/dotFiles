# ~/.bashrc

# Append "$1" to $PATH when not already in.
append_path() {
    case ":$PATH:" in
    *:"$1":*) ;;
    *)
        PATH="${PATH:+$PATH:}$1"
        ;;
    esac
}
append_path "$HOME/.local/bin"
# Android Emulator
append_path "/opt/android-sdk/emulator"
# Java
append_path "/usr/lib/jvm/default"
append_path "/opt/android-sdk/tools/bin/"
append_path "/opt/android-sdk/platform-tools"

append_path "$HOME/.local/bin/Grayjay.Desktop-linux-x64-v4"

export ANDROID_HOME="$HOME/.android/android-sdk"

export HISTSIZE=100000
export HISTFILESIZE=2000000

# You may need to manually set your language environment
export LANG=en_US.UTF-8
### EXPORT ### Should be before the change of the shell
export EDITOR=/usr/bin/nvim
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups:ignorespace
export HISTIGNORE="&:[bf]g:exit:clear:history:pwd:cd:source:reload:helpful:ls:ll:la:lt"
export HISTTIMEFORMAT="$(echo -e "%d/%m/%y %T")" # Add date and time to history.

export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

# This is used for i3, sterm and slock
export BROWSER="vivaldi"
export TERMINAL="xterm"
export TERMINAL_PROG="xterm"
export FILEMGR="mc"

export PAGER='less'

export SHELL=$(which bash)
export PLATFORM=$(uname -o)
export COLORTERM='truecolor'

export NVIDA_VISIBLE_DEVICES='all'
export CUDA_VISIBLE_DEVICES='all'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT_COMMAND='PS1_CMD1=$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"'); PS1_CMD2=$(git rev-parse --abbrev-ref HEAD 2>/dev/null 1>/dev/null && echo "$(git rev-parse --abbrev-ref HEAD) -> $(git rev-parse --abbrev-ref @{u} || echo none) $(git status --porcelain | awk '"'"'/^[MADRCU]./{s++}/^.[MADRCU]/{u++}/^\?\?/{t++}END{print "(S:"s+0" U:"u+0" T:"t+0")"}'"'"')");'

PS1='\n\[\e[1m\]\d\[\e[0;2;3m\]@\[\e[0;1;38;5;209m\]\A\e[0m\] ${PS1_CMD2}\n(\[\e[38;5;209;1m\]\l\[\e[0m\]|\[\e[1m\]\#\[\e[0m\]|\[\e[1m\]\j\[\e[0m\]|\[\e[1m\]$?\[\e[0m\]) [\[\e[96m\]\u\[\e[0m\]@\[\e[2m\]${PS1_CMD1}\[\e[0m\]] \w: '

# Use bash-completion, if available
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Bash aliases
[[ -f ~/.bash_aliases ]] && . "$HOME"/.bash_aliases

# X-Options
[[ -x $(command -v xset) ]] && xset r rate 250 50

set -o vi
set show-all-if-ambiguous on
set show-all-if-unmodified on
set menu-complete-display-prefix on
bind TAB:menu-complete
bind -x '"\C-l": clear'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#shopt
shopt -s autocd  # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ./dircolors)" || eval $(dircolors -b)
fi

alias ls='ls -h --color=auto'
alias dir='dir --color=auto'
alias pacman='pacman --color=auto'
alias grep='grep --color=auto'
