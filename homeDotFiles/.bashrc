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
export FILEMGR="ranger"

export PAGER='more'

export TERM=xterm-256color
export SHELL=$(which bash)

export BFETCH_INFO="pfetch"
export BFETCH_ART="cowsay '<3 Athena OS'"
export BFETCH_COLOR="$HOME/.local/textart/color/icon/panes.textart"

export PAYLOADS="/usr/share/payloads"
export SECLISTS="$PAYLOADS/seclists"
export PAYLOADSALLTHETHINGS="$PAYLOADS/payloadsallthethings"
export FUZZDB="$PAYLOADS/fuzzdb"
export AUTOWORDLISTS="$PAYLOADS/autowordlists"
export SECURITYWORDLIST="$PAYLOADS/security-wordlist"

export MIMIKATZ="/usr/share/windows/mimikatz/"
export POWERSPLOIT="/usr/share/windows/powersploit/"

export ROCKYOU="$SECLISTS/Passwords/Leaked-Databases/rockyou.txt"
export DIRSMALL="$SECLISTS/Discovery/Web-Content/directory-list-2.3-small.txt"
export DIRMEDIUM="$SECLISTS/Discovery/Web-Content/directory-list-2.3-medium.txt"
export DIRBIG="$SECLISTS/Discovery/Web-Content/directory-list-2.3-big.txt"
export WEBAPI_COMMON="$SECLISTS/Discovery/Web-Content/api/api-endpoints.txt"
export WEBAPI_MAZEN="$SECLISTS/Discovery/Web-Content/common-api-endpoints-mazen160.txt"
export WEBCOMMON="$SECLISTS/Discovery/Web-Content/common.txt"
export WEBPARAM="$SECLISTS/Discovery/Web-Content/burp-parameter-names.txt"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# switch shell
[[ $(ps --no-header --pid=$PPID --format=comm) != "${SHELL#/usr/bin/}" && -z ${BASH_EXECUTION_STRING} && ${SHELL} != "/usr/bin/bash" ]] && exec $SHELL

#Configure zoxide for bash
eval "$(zoxide init bash)"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Bash aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi



# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export PROMPT_COMMAND='source ~/.bashrc no-repeat-flag'

buffer_clean(){
  free -h && sudo sh -c 'echo 1 >  /proc/sys/vm/drop_caches' && free -h
}

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
