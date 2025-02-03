# Always sourced, First
# Add everything in ~/.local/bin to the PATH
export PATH="$PATH$(find $HOME/.local/bin -type d -printf :%p)"

# Preferred editor for local and remote sessions 
export EDITOR='nvim' 
export VISUAL='nvim' 
export FILEMGR="ranger"

# This is used for i3, sterm and slock
export BROWSER="vivaldi"
export TERMINAL="xterm"
export TERMINAL_PROG="xterm"

# Program specific settings
# ------------------------

# Pipewire, but for libvirt
export PIPEWIRE_RUNTIME_DIR="/run/user/1000/"

# Ranger file manager
export RANGER_LOAD_DEFAULT_RC=FALSE
