#!/bin/sh

BINDIR="./binaries"
FONTDIR="./fonts"

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

# The rest of the script continues here...

# Check if required directories exist
if ! [ -d "dotConfigFiles" ] || ! [ -d "homeDotFiles" ]; then
    echo "Config directories not found, aborting.
    Expected to find './dotConfigFiles' & './homeDotFiles'"
    exit 1
fi

clear

echo "Making config directories if needed..."
# Create necessary directories if they don't exist
mkdir -p "$HOME/.config" "$HOME/.local/bin"

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

cd ..

# Make the downloads
ln -sf /storage/emulated/0 root
ln -sf ./root/Downloads downloads
