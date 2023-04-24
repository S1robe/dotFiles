# Totally ripped off Dallas theme


# Grab the current date (%W) and time (%t):
T_TIME_="%F{#bca6ec}# %F{#666666}|%F{#a3c899}%W%{$reset_color%}@%F{#a3c899}%t%F{#666666}| (%{$reset_color%}"


# Grab the current machine name 
T_MACHINE_="%F{#bca6ec}%m% %F{#666666})%F{#24ecff}:%{$reset_color%}"

# Grab the current username 
T_CURRENT_USER_="%F{#99b3B8}%n%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
T_LOCA_="%{$fg[orange]%}%~\$(git_prompt_info)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}@%{$fg_bold[white]%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"

PROMPT="$T_TIME_$T_CURRENT_USER_@$T_MACHINE_$T_LOCA_
   "
