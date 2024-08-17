# Always sourced, First
# Add everything in ~/.local/bin to the PATH
export PATH="$PATH$(find "$HOME"/.local/bin -type d -printf :%p)"

# This is used for most commands that rely on $EDITOR
# like ranger or visudo
# Preferred editor for local and remote sessions 
export EDITOR='nvim' 
export VISUAL='nvim' 
export FILEMGR="ranger"

# This is used for i3, sterm and slock
export BROWSER="vivaldi"
export TERMINAL="xterm"
export TERMINAL_PROG="xterm"

# This is used by sterm and slock for compliation.
export FONT="ter-u32b"
export USRSHELL="$SHELL"

# Program specific settings
# ------------------------

# Pipewire, but for libvirt
export PIPEWIRE_RUNTIME_DIR="/run/user/1000/"

# Ranger file manager
export RANGER_LOAD_DEFAULT_RC=FALSE

#Java
export JAVA_HOME="/usr/lib/jvm/default/"
export PATH=$PATH:$JAVA_HOME

#Flutter 
#export PATH=$PATH:/usr/bin/flutter/bin

function rand-str {
    # Return random alpha-numeric string of given LENGTH
    #
    # Usage: VALUE=$(rand-str $LENGTH)
    #    or: VALUE=$(rand-str)

    local DEFAULT_LENGTH=64
    local LENGTH=${1:-$DEFAULT_LENGTH}

    LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c "$LENGTH"
    printf '\n'
    # LC_ALL=C: required for Mac OS X - https://unix.stackexchange.com/a/363194/403075
    # -dc: delete complementary set == delete all except given set
}
export -f rand-str
