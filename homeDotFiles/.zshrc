# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="default"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update
# behavior zstyle ':omz:update' mode disabled  # disable automatic
# updates zstyle ':omz:update' mode auto      # update
# automatically without asking 
# just remind me to update when it's time
zstyle ':omz:update' mode reminder

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting
# for completion. You can also set it to another string to have
# that shown instead of the default red dots. e.g.
COMPLETION_WAITING_DOTS="%F{orange}waiting...%f" # Caution: this
# setting can cause issues with multiline prompts in zsh < 5.7.1
# (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking
# untracked files under VCS as dirty. This makes repository status
# check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command
# execution time stamp shown in the history command output. You
# can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or set a custom format
# using the strftime function format specifications, see 'man
# strftime' for details. HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? Standard plugins can be
# found in $ZSH/plugins/ Custom plugins may be added to
# $ZSH_CUSTOM/plugins/ Example format: plugins=(rails git textmate
# ruby lighthouse) Add wisely, as too many plugins slow down shell
# startup.
plugins=(extract git gh colored-man-pages ripgrep zsh-navigation-tools)

source $ZSH/oh-my-zsh.sh
autoload -U compinit; compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment export
# LANG=en_US.UTF-8

#X-options
xset r rate 250 50 # key refresh rate

# Compilation flags export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh
# libs, plugins, and themes. Aliases can be placed here, though
# oh-my-zsh users are encouraged to define aliases within the
# ZSH_CUSTOM folder. For a full list of active aliases, run
# `alias`.-

# Custom Aliases
alias l="ls -llo"

#Options
unsetopt BEEP
