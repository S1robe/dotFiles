### ALIASES ###

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

# alias ls='eza --color=auto'
# alias la='eza -a'
# alias lx='eza -lhs extension' # sort by extension
# alias lk='eza -lhs size' # sort by size
# alias lc='eza -lhs changed' # sort by change time
# alias lu='eza -lhs accessed' # sort by access time
# alias lr='eza -lRh' # recursive ls
# alias lt='eza -lhs modified' # sort by modification date
# alias lz='eza -lhs created' # sort by creation date
# alias lm='eza -alh | more' # pipe through 'more'
# alias lw='eza -xGah' # wide listing format
# alias ll='eza -alFh' # long listing format
# alias labc='eza -lhs name' #alphabetical sort
# alias lf="eza -l | grep -E -v '^d'" # files only
# alias ldir="eza -l | grep -E '^d' --color=never" # directories only
# alias l='eza'
# alias l.="eza -a | grep -E '^\.' --color=never"

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# alias to copy file content to clipboard
alias cpc='xclip < '

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias follow="tail -f -n +1"

#readable output
alias df='df -h'

# Alias's to modified commands
#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -iv'
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

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#systeminfo
#alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:\$//g' | grep -v '[0-9]\$' | xargs tail -f"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

#fix obvious typo's
alias cd..='cd ..'
alias udpate='sudo pacman -Syyu'
