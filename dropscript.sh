#!/bin/sh

BINDIR="./binaries"
FONTDIR="./fonts"

echo "I should be run in the same directory as my configs. 
This script is intended to be a clone & run type script.
Press <enter> to continue if you're sure..."

read 

if ! [ -d "dotConfigFiles" ] || ! [ -d "homeDotFiles" ]; then
    echo "config directories not found, aborting.
    expected to find './dotConfigfiles' & './homeDotFiles'"
    exit 0
fi

clear

echo "Making config directories if needed..."
if ! [ -d "$HOME"/.config ]; then 	mkdir --parents -v "$HOME"/.config; fi
if ! [ -d "$HOME"/.local ]; then	mkdir --parents -v "$HOME"/.local/{bin,src,share}; fi

# Link all config files to $HOME/.config
cd dotConfigFiles
for fle in ./*
do 	
	fle=${fle##*/}
	ln -sf "$PWD/$fle" "$HOME/.config/$fle"
done

cd ../homeDotFiles
for fle in $(ls -lA | awk '{print $9}')
do	
	fle=${fle##*/}
	ln -sf "$PWD/$fle" "$HOME/$fle" 
done

cd ..
mkdir "$HOME/.local/bin/cbin"
# Link custom binaries to the users local bin path.
ln -s "$BINDIR" "$HOME/.local/bin/cbin"

# Link fonts to the local fonts directory
#if ! [ -d "$HOME/.local/bin/share/fonts" ]; then
#	ln -s "$FONTDIR" "$HOME/.local/bin/share/fonts"
#else
#	ln -s "$FONTDIR" "$HOME/.local/bin/share/fonts/cfonts"
#fi
