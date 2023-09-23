# [usr@mchne]: <path><gitinfo>

RCOL="%{$reset_color%}"
PURPLE="%F{#bca6ec}"
GRAY="%F{#666666}"
GREEN="%F{#a3c899}"
ORANGE="%F{#FF8C25}"
SEP="|"
# Grab the current date (%W) and time (%t):
#TIME_="%F{#bca6ec}# %F{#666666}|%F{#a3c899}%W%{$reset_color%}@%F{#a3c899}%t%F{#666666}| %{$reset_color%}"

# left border
B_LEFT="$GRAY [$RCOL"
# right border
B_RIGHT="$GRAY]$RCOL"
# Grab the current username (%n)
C_USER="$ORANGE%n$RCOL"
# Grab the current machine name(%m)
C_MCHNE="$PURPLE%m$RCOL"
# Grab current Path (%~)
C_PATH="%~"
# Command Section
C_CMD="$GRAY:"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
C_LOCA_="%{$fg[orange]%}%~\$(git_prompt_info)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}@%{$fg_bold[purple]%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="$RCOL"

ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}o"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}o"

PROMPT="$B_LEFT$C_USER@$C_MCHNE: $C_LOCA_$B_RIGHT$C_CMD "
