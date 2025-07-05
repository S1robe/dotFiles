#!/bin/sh

set -e # if sub script fails, then this script does too.

# Install program called "abiword"
if !  abiword --version 2> /dev/null 1> /dev/null  0> /dev/null; then
  echo "abiword not installed, please install from your package manager"
  exit 1
fi

if !  gpg --version 2> /dev/null 1> /dev/null 0> /dev/null;  then
  echo "gpg not installed, you will not be able to read the files without gpg"
  exit 1
fi

printf "Enter the exact path of where the GPGKEY file is.\nIf the key is already imported, then enter nothing."
read -r GPGPATH

if [ -n "$GPGPATH" ]; then
  gpg --import "$GPGPATH"
else 
  echo "Skipping import"
fi


# Get the GPGID from STD out
GPGID=$(gpg -k "Compliance" | awk 'FNR ==2 {print $1}')

echo "Enter the exact path of where the documents to covert to pdf and sign are."
read -r DOCDIR

# Convert all .doc/x to .pdf silently
find "$DOCDIR" -type f -iname "*.docx" -exec abiword --to=pdf 2>/dev/null {} \;

# Comment in key is "Compliance, this wil"

find "$DOCDIR" -type f -iname "*.pdf" -exec gpg --detach-sign -u "$GPGID" {} \;

echo "Would you like to remove all .doc/x files? (y/N)"
read -r _CONFIRM_

case ${_CONFIRM_} in
  ([yY]) find "$DOCDIR" -type f -iname "*.docx" -exec rm {} \;
esac

echo "Would you like to remove all .pdf files? (y/N)"
read -r _CONFIRM_

case ${_CONFIRM_} in
  ([yY]) find "$DOCDIR" -type f -iname "*.pdf" -exec rm {} \;
esac

GPGID=""
DOCDIR=""
GPGPATH=""
_CONFIRM_=""
