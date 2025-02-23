### ALIASES ###

alias 'rand-str'="tr -dc A-Za-z0-9\[\]\{\}\+\=\\-\)\(\*\&\^\%\$\#\@\!\~\'\"\;: </dev/urandom | head -c 64"

#tmux
alias tmux='tmux -u'

# Alias's for multiple directory listing commands
alias ls='lsd --color=auto'
alias la='lsd -a'
alias lx='lsd -lXh' # sort by extension
alias lk='lsd -lSrh' # sort by size
alias lr='lsd -lRh' # recursive ls
alias lt='lsd -ltrh' # sort by date
alias lm='lsd -alh | more' # pipe through 'more'
alias ll='lsd -alFh' # long listing format
alias lf="lsd -l | grep -E -v '^d'" # files only
alias ldir="lsd -l | grep -E '^d' --color=never" # directories only
alias l='lsd'
alias l.="lsd -A | grep -E '^\.' --color=never"

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias follow="tail -f -n +1"

#readable output
alias df='df -h'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'

#free
alias free="free -mt"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='pacman --color auto'
alias update='sudo pacman -Syyu'


#systeminfo
#alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'
