# Always sourced, First

# Add everything in ~/.local/bin to the PATH
export PATH="$PATH$(find $HOME/.local/bin -type d -printf :%p)"

# This is used for most commands that rely on $EDITOR
# like ranger or visudo
export EDITOR="nvim"
export VISUAL="nvim"
export FILEMGR="dolphin"

# This is used for i3, sterm and slock
export BROWSER="brave"
export TERMINAL="xterm"
export TERMINAL_PROG="xterm"

# This is used by sterm and slock for compliation.
#export FONT="Monocraft\ Nerd\ Font"
export FONTSIZE="16"
export USRSHELL="$SHELL"

# Program specific settings

# Pipewire, but for libvirt
export PIPEWIRE_RUNTIME_DIR="/run/user/1000/"

# Ranger file manager
export RANGER_LOAD_DEFAULT_RC=FALSE

# Spicetify
export PATH=$PATH:/home/owner/.spicetify
export PATH=$PATH:/opt/flutter/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_PATH/lib
