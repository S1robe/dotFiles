#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If Display isnt set (being used already) then start the xserver 
if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi
