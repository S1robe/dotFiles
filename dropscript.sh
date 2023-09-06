#!/bin/sh

# Link all config files to $HOME/.config
cd configs/config

for i in *
do
    # Make symbolic interactive link, do not force.
	ln -si "$PWD/${i##*/}" "$HOME/.config/${i##*/}"
done

# Link all user profile files
cd ../user

for i in ./.*
do
	ln -si "$PWD/${i##*/}" "$HOME/${i##*/}"
done

# Link the binaries to $HOME/.local/bin 
cd ../binaries

if ! [ -f "$HOME/.local/bin" ]; then 
	mkdir -p "$HOME/.local/bin"
fi

for i in ./.*
do
	ln -si "$PWD/${i##*/}" "$HOME/.local/bin/${i##*/}"
done

# Check if sudo exists
#if ! [ -z $(which -a sudo | grep "not") ] && [ ]; then
    # sudo exists
#fi
