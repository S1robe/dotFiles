# This is for settings and options

# If Display isnt set (being used already) then start the xserver 
if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi

# Custom Aliases
alias l="ls -llo"

# Either runs and configures the monitors or does nothing
source "$HOME"/.screenlayout/verticalplasma.sh 2> /dev/null 1> /dev/null 0> /dev/null
