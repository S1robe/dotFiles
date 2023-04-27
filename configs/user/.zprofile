#Run me on startup
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx
fi


xset r rate 300 50
xset s 60
unsetopt PROMPT_SP

export EDITOR="nvim"
export VISUAL="nvim"
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="librewolf"


