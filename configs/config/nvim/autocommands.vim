

autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; make clean; sudo -E make install && { killall -q dwm;setsid dwm & }

autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; make clean; sudo -E make install && { killall -q dwmblocks;setsid dwmblocks & }

autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/st/; make clean; sudo -E make install && { killall -q st;setsid st & }

autocmd BufNewFile,BufRead *.cup setf cup
