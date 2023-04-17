

autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install && { killall -q dwm;setsid dwm & }

autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }

autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make install && { killall -q st;setsid st & }
