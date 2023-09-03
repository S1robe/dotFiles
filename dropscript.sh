#!/bin/sh

cd configs/config

for i in *
do
	ln -si "$PWD/${i##*/}" "$HOME/.config/${i##*/}"
done

cd ../user

for i in ./.*
do
	ln -si "$PWD/${i##*/}" "$HOME/${i##*/}"
done

cd ../binaries

if ! [ -f "$HOME/.local/bin" ]; then 
	mkdir -p "$HOME/.local/bin"
fi

for i in ./.*
do
	ln -si "$PWD/${i##*/}" "$HOME/.local/bin/${i##*/}"
done
