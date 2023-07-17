#Run me on startup

export PATH="$PATH$(find ~/.local/bin -type d -printf :%p)"

export PATH="$PATH:/opt/android-sdk/platform-tools"
export PATH="$PATH:/opt/android-sdk/tools"

export EDITOR="nvim"
export VISUAL="nvim"
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="librewolf"
export FONT="Coder\'s\ Crux"
export DWMFONT="Monocraft\ Nerd\ Font"
export FONTSIZE="20"
export USRSHELL="$SHELL"
export PIPEWIRE_RUNTIME_DIR="/run/user/1000/pulse/native"


alias l="ls -llo"


if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi


if [ $(head -n 1 /etc/hostname) = "Core" ]; then

xrandr --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP-1-0 --off --output DP-1-1 --off --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --off --output DP-1-3 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-4 --off --output DP-1-5 --off

fi



