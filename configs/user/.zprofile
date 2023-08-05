#Run me on startup

export PATH="$PATH$(find ~/.local/bin -type d -printf :%p)"

export EDITOR="nvim"
export VISUAL="nvim"
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMINAL="st"
export TERMINAL_PROG="st"
export FONT="Source\ Code\ Pro"
export DWMFONT="Monocraft\ Nerd\ Font"
export FONTSIZE="12"
export USRSHELL="$SHELL"
export PIPEWIRE_RUNTIME_DIR="/run/user/1000/pulse/native"


alias l="ls -llo"


if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi

xset r rate 230 50 # key refresh rate
xset s 60       # spacing rate
xset -b         # disable bell


if [ $(head -n 1 /etc/hostname) = "Core" ]; then
    source "$HOME"/.screenlayout/verticalplasma.sh
fi



