#!/bin/sh

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

    # Link all config files to $HOME/.config
    cd dotConfigFiles || exit
    for fle in ./*; do
        fle=${fle##*/}
        ln -sf "$PWD/$fle" "$HOME/.config/$fle"
    done

    cd ../homeDotFiles || exit
    for fle in ./*; do
        fle=${fle##*/}
        ln -sf "$PWD/$fle" "$HOME/$fle"
    done

}

dropFonts() {
    # Link fonts to the local fonts directory
    if ! [ -d "$HOME/.local/share/fonts" ]; then
        ln -sr "$FONTDIR" "$HOME/.local/share/fonts"
    else
        cp -r "$FONTDIR/"* "$HOME/.local/share/fonts/"
    fi
    fc-cache -fv "$HOME/.local/share/fonts"
}

setupDirs() {
    BINDIR="./binaries"
    FONTDIR="./fonts"

    # Create binary directory and link custom binaries
    mkdir -p "$HOME/.local/bin/cbin"
    ln -sf "$BINDIR" "$HOME/.local/bin/cbin"

    echo "Making config directories if needed..."
    # Create necessary directories if they don't exist
    mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/.local/src" "$HOME/.local/share"
    ln -sr "$FONTDIR" "$HOME/.local/share/fonts"

    # Create additional directories
    mkdir -p "$HOME/docs" "$HOME/proj" "$HOME/down"
    ln -s "$HOME/down" "$HOME/Downloads"
}
