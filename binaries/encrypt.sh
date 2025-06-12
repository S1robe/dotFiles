#!/bin/sh

if [ "$#" -ne "2" ]; then
  echo "You need to specify the file name then the file to encrypt."
  echo "Usage encrypt.sh <File name> <Dir or file to encrypt>"
  exit 1
fi

7z a -mhe=on "$1.7z" "$2" -p
