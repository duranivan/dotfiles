# Save this file in ~/.oh-my-zsh/themes/

local resetColor="%{$reset_color%}"
# local prefix="%{$fg_bold[white]%}▲"
local prefix="%{$fg[white]%}▲"
local prefix_error="%{$fg[magenta]%}△"
# local dir="%{$fg_bold[white]%}%c$resetColor"
local dir="%{$fg[white]%}%c$resetColor"
local ret_status="%(?:$prefix :$prefix_error )"

PROMPT='$ret_status$resetColor $dir$(git_prompt_info) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}(%{\x1b[3m%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{\x1b[0m%}%{$fg[white]%}) %{$fg_bold[white]%}✗"
ZSH_THEME_GIT_PROMPT_DIRTY="%{\x1b[0m%}%{$fg[white]%}) %{$fg[white]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="\e[0m%{$fg[white]%}) %{$fg_bold[white]%}︎✓"
ZSH_THEME_GIT_PROMPT_CLEAN="%{\x1b[0m%}%{$fg[white]%})"