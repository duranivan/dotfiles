collapsed_wd() {
  # echo "%{$fg[blue]%}%(5~|…/%3~|%~)"
  cwd=$(pwd)
  home=$(echo $HOME)
  if [ "$cwd" = "$home" ]; then
    echo '-'
  else
    echo $(echo "$(dirname "$PWD")" | perl -pe '
      BEGIN {
        binmode STDIN,  ":encoding(UTF-8)";
        binmode STDOUT, ":encoding(UTF-8)";
      }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
    ')
  fi
}

prompt_indicator() {
  local LVL=$SHLVL

  # if [[ $EUID -eq 0 ]]; then
  if [[ $LVL -gt 1 ]]; then
    # local SUFFIX='%F{yellow}%n%f'$(printf '%%F{yellow}\u276f%.0s%%f' {1..$LVL})
    local SUFFIX=$(printf '%%F{yellow}\u276f%.0s%%f' {1..$LVL})
  else
    # local SUFFIX=$(printf '%%F{red}\u276f%.0s%%f' {1..$LVL})
    local SUFFIX=$(printf '%%F{red}\u276f%.0s%%f')
  fi
   # echo $'%B\u276f%b'
   echo "%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%B%1~%b%F{yellow}%B%(1j.*.)%(?..!)%b%f %B${SUFFIX}%b"
}

# PROMPT+="%(?:%{$fg_bold[green]%}$(prompt_indicator) :%{$fg_bold[red]%}❯ )%{$reset_color%}"
# PROMPT="%(?:%{$fg_bold[green]%}$(prompt_indicator) :%{$fg_bold[red]%}$(prompt_indicator) )%{$reset_color%}"
PROMPT="$(prompt_indicator) "

# Default values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
# ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# used git-prompt plugin for oh-my-zsh
# see https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-prompt
RPROMPT='$(git_super_status) %{$fg[blue]%}$(collapsed_wd)'
