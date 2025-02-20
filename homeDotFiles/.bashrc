# ~/.bashrc

# Append "$1" to $PATH when not already in.
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}
append_path "$HOME/.local/bin"

HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s histappend

### EXPORT ### Should be before the change of the shell
export EDITOR=/usr/bin/nvim
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups:ignorespace

export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

# This is used for i3, sterm and slock
export BROWSER="vivaldi"
export TERMINAL="xterm"
export TERMINAL_PROG="xterm"
export FILEMGR="mc"

export PAGER='more'

export TERM=xterm-256color
export SHELL=$(which bash)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# switch shell
[[ $(ps --no-header --pid=$PPID --format=comm) != "${SHELL#/usr/bin/}" && -z ${BASH_EXECUTION_STRING} && ${SHELL} != "/usr/bin/bash" ]] && exec $SHELL

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Bash aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

function rand-str {
    # Return random alpha-numeric string of given LENGTH
    #
    # Usage: VALUE=$(rand-str $LENGTH)
    #    or: VALUE=$(rand-str)

    local DEFAULT_LENGTH=64
    local LENGTH=${1:-$DEFAULT_LENGTH}

    LC_ALL=C tr -dc A-Za-z0-9\[\]\{\}\+\=\\-\)\(\*\&\^\%\$\#\@\!\~\'\"\;: </dev/urandom | head -c "$LENGTH"
    printf '\n'
    # LC_ALL=C: required for Mac OS X - https://unix.stackexchange.com/a/363194/403075
    # -dc: delete complementary set == delete all except given set
}
export -f rand-str
[[ $1 != no-repeat-flag && -f /usr/share/blesh/ble.sh ]] && source /usr/share/blesh/ble.sh

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="rr"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=false

# To enable/disable display of Python virtualenv and condaenv
OMB_PROMPT_SHOW_PYTHON_VENV=true  # false
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  ssh
  gh
  defaults
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bashmarks
)

source "$OSH"/oh-my-bash.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# X-Options
xset r rate 250 50

set show-all-if-ambiguous on
set show-all-if-unmodified on
set menu-complete-display-prefix on
bind TAB:menu-complete

alias today='date +"%Y-%m-%dT%H:%M:%S%:z"'
export COLORTERM='truecolor'
