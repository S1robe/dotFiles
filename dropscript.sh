#!/bin/bash

# Display the prompt message
echo "I should be run in the same directory as my configs.
This script is intended to be a clone & run type script.
Enter 'y' to continue."

# Read user input
read -r confirm

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
    echo "Using shell $shell and display $display"

    cd homeDotFiles || exit
    if [ $shell = "bash" ]; then
        find "." -maxdepth 1 ! -name "*zsh*" ! -name ".zprofile" ! -name '.' -exec ln -s "$(pwd)/{}" "$HOME/{}" \;

    elif [ $shell = "zsh" ]; then
        find "." -maxdepth 1 ! -name "*bash*" ! -name '.' -exec ln -s "$(pwd)/{}" "$HOME/{}" \;
    fi
    cd ../dotConfigFiles || exit
    # Later on we will implement the display hook
    find "." -maxdepth 1 ! -name '.' -exec ln -s "$(pwd)/{}" "$HOME/.config/{}" \;
    cd ..
}
        fle=${fle##*/}

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
    ln -s "$HOME/down" "$HOME/Downloads"
}

setupDirs
dropFonts
dropConfigs "$1" "$2"
