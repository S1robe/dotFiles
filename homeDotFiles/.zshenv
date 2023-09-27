# Always sourced, First

# Add everything in ~/.local/bin to the PATH
export PATH="$PATH$(find $HOME/.local/bin -type d -printf :%p)"

# This is used for most commands that rely on $EDITOR
# like ranger or visudo
export EDITOR="nvim"
export VISUAL="nvim"

# This is used by sterm and slock for compliation.
export FONT="Monocraft\ Nerd\ Font"
export FONTSIZE="16"
export USRSHELL="$SHELL"

# Program specific settings

# Ranger file manager
export RANGER_LOAD_DEFAULT_RC=FALSE
