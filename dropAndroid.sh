#!/bin/sh

echo "Enter 'y' to continue."
read -r confirm

[ "$confirm" != "y" ] && [ "$confirm" != "Y" ] || exit 0

# Check if required directories exist
! [ -d "dotConfigFiles" ] || ! [ -d "homeDotFiles" ] || exit 0

echo "Making config directories if needed..."

mkdir -p "$HOME/.config"
# Link all config files to $HOME/.config
cd dotConfigFiles || exit
find dotConfigFiles -maxdepth 1 -not -path . -exec ln -sf "$(realpath {})" "$HOME/.config/" \; 
cd ../homeDotFiles || exit
find homeDotFiles -maxdepth 1 -not -path . -exec ln -sf "$(realpath {})" "$HOME" \; 

cd ..
# Make the downloads
ln -sf /storage/emulated/0 root
ln -sf ./root/Downloads downloads

pkg update -y && pkg upgrade -y && pkg autoclean -y
pkg install -y tmux git neovim man openssh openssl termux-api 
pkg remove -y nano 

git clone "https://github.com/S1robe/kickstart.nvim" ".config/nvim"

