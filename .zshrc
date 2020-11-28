# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="myown"
# ZSH_THEME="gnzh"
# ZSH_THEME="Predawn"
# ZSH_THEME="cobalt2"
# ZSH_THEME="spaceship"
# ZSH_THEME="zeit"
# ZSH_THEME="robbyrussell"
ZSH_THEME="yusufs"
# SPACESHIP_DIR_SHOW=true
# SPACESHIP_PROMPT_SYMBOL="▲"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting git-prompt)

# User configuration

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/usr/local/bin:$HOME/.fzf/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Make neovim the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# some more aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias cdd='cd ~/Dropbox'
alias cdp='cd ~/pCloud'
alias pd='pwd'
alias up='cd ..'
alias sap='sudo apt-get install'
# alias tmux='tmux -2'
alias xc='pwd | xsel -b'
alias xv='xsel -b'
alias octavet='octave --no-gui'
alias nv="nvim"
alias st="subl"
alias cds="cs /Users/Yusuf/Library/Application\ Support/Sublime\ Text\ 3/Packages/"
alias em="/usr/local/Cellar/emacs-plus/24.5/Emacs.app/Contents/MacOS/Emacs -nw"
alias emg="/usr/local/Cellar/emacs-plus/24.5/Emacs.app/Contents/MacOS/Emacs &"
alias emc="emacsclient -n"
alias rstudio='open -a Rstudio'
alias mk="open -a 'Marked 2'"
alias code="code -r"
alias coin="code-insiders -r"

# Fucntion to find directory with fzf
function cdf () {
    cd "$(find * -type d | fzf)"
}

# Fuction to run ls after cd
function cs () {
    cd "$@" && ls
}
# Fuction to run la after cd
function ca () {
    cd "$@" && la
}
# Fuction to cd into just created dir
function mkcd () {
    mkdir -p "$1" && cd "$1"
}
# Function to create file and together with path recursively.
function mkf () {
    DIR=$(dirname "$1")
    FILE=$(basename "$1")
    mkcd "${DIR}" && touch "${FILE}" 
}

# home folder bin path
export PATH="$HOME/bin:$PATH"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default-dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# set -o vi
# bindkey -v
# bindkey fd vi-cmd-mode

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/shims:$PATH"

export GIT_HOME='/usr/local/Cellar/git/2.7.0/bin'

export PATH=$GIT_HOME:$PATH
export PATH="$PATH:/Users/Yusuf/bin:/Library/TeX/Distributions/Programs/texbin/"

# for GO programmming
export GOROOT="/usr/local/go"
export GOPATH="$HOME/goworkspace"
export GOBIN="$HOME/goworkspace/bin"
export PATH="$HOME/goworkspace/bin:$PATH"

# for Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Path for Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Include Z, yo
. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh

eval $(/usr/libexec/path_helper -s)

# NOTE: Zsh syntax highlighting like in Fish (Keep this last)
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprezto
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always --line-range :30 {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -30'"

# make vim the PAGER reader for psql
# export PAGER='vim -R -u ~/.vimrcpg -'

# Add homebrew's python3 and pip3 as default (so no need to add the 3 at the end)
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# source $HOME/.rvm/scripts/rvm

# Deno bin Path
export PATH="/Users/ivan/.deno/bin:$PATH"

# Gruvobox theme
source "$HOME/.config/nvim/autoload/plugged/gruvbox/gruvbox_256palette_osx.sh"

# JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`
