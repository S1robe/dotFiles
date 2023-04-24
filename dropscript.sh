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
