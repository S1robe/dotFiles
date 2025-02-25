#!/bin/bash

# Display the prompt message
echo "I should be run in the same directory as my configs.
This script is intended to be a clone & run type script.
Enter 'y' to continue."

# Read user input
read -r confirm
[[ -x $(command -v pacman) ]] && INSTALL="$(command -v pacman) -Syu"
[[ -x $(command -v apt) ]] && INSTALL="$(command -v apt) install"

# Either Android or GNU/Linux
PLATFORM=$(uname -o)

# Check if the user confirmed with 'y' or 'Y'
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Aborting... You did not confirm with 'y'."
    exit 1
fi

# Continue with the rest of the script
echo "Proceeding with the script..."

# Check if required directories exist
if ! [ -d "dotConfigFiles" ] || ! [ -d "homeDotFiles" ]; then
    echo "Config directories not found, aborting.
    Expected to find './dotConfigFiles' & './homeDotFiles'"
    exit 1
fi

# should allow this to take a parameter for shell type
# Like bash vs ZSH vs Android. Since I switch between them.
dropConfigs() {
    shell="${1:-bash}"
    display="${2:-i3}"

    if [ "$PLATFORM" == "Android" ]; then
        display="Android"
    fi

    echo "Using shell $shell and display $display"
    cd homeDotFiles || exit

    if [ $shell = "bash" ]; then
        find "." -maxdepth 1 ! -name "*zsh*" ! -name ".zprofile" ! -name '.xinitrc' ! '.Xresources' ! -name '.' -exec ln -s "$(pwd)/{}" "$HOME/{}" \;

    elif [ $shell = "zsh" ]; then
        find "." -maxdepth 1 ! -name "*bash*" ! -name '.xinitrc' ! '.Xresources' ! -name '.' -exec ln -s "$(pwd)/{}" "$HOME/{}" \;
    fi

    if ! [ "$display" == "Android" ]; then
        ln -s "$(pwd)/.xinitrc" "$HOME/.xinitrc"
        ln -s "$(pwd)/.Xresources" "$HOME/.Xresources"
    fi

    cd ../dotConfigFiles || exit
    # Later on we will implement the display hook
    find "." -maxdepth 1 ! -name '.' -exec ln -s "$(pwd)/{}" "$HOME/.config/{}" \;
    cd ..
}

dropFonts() {
    # Link fonts to the local fonts directory
    if ! [ -d "$HOME/.local/share/fonts" ]; then
        ln -s "$(pwd)/fonts" "$HOME/.local/share/fonts"
    else
        cp -r "fonts" "$HOME/.local/share/fonts/"
    fi
    fc-cache -fv "$HOME/.local/share/fonts"
}

setupDirs() {
    echo "Making config directories if needed..."
    # Create necessary directories if they don't exist
    mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/.local/src" "$HOME/.local/share"
    # Create additional directories
    mkdir -p "$HOME/docs" "$HOME/proj" "$HOME/down"

    if [ "$PLATFORM" == "Android" ]; then
        ln -sf /storage/emulated/0/Download down
        ln -sf /storage/emulated/0 root
    else
        ln -s "$HOME/down" "$HOME/Downloads"
    fi

}

installpkgs() {
    $INSTALL tmux screen neovim man openssh openssl ripgrep ripgrep-all fzf lsd fontconfig-utils newsboat neomutt net-tools iproute2 bash-completion which xterm postgresql npm nodejs rust python clang mc
    if [ "$PLATFORM" == "Android" ]; then
        $INSTALL termux-api termux-x11-repo termux-am termux-auth termux-tools 
    else 
        $INSTALL docker docker-compose ollama dunst w3m feh alsamixer wireplumber linux-firmware
    fi

    git clone "https://github.com/S1robe/kickstart.nvim" ".config/nvim"
}

setupDirs
installpkgs
dropFonts
dropConfigs "$1" "$2"
