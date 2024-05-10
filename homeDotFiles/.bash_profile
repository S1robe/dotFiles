# .bash_profile -*- mode: sh -*-

# Load login settings and environment variables
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

# Load interactive settings
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# If Display isnt set (being used already) then start the xserver 
if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi

source "$HOME"/.screenlayout/verticalplasma.sh 2> /dev/null 1> /dev/null 0> /dev/null
