# Path to your oh-my-zsh installation.
export ZSH=/Users/Yusuf/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="myown"
# ZSH_THEME="gnzh"
# ZSH_THEME="Predawn"
# ZSH_THEME="cobalt2"
# ZSH_THEME="spaceship"
# ZSH_THEME="zeit"
SPACESHIP_DIR_SHOW=true
SPACESHIP_PROMPT_SYMBOL="▲"

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
plugins=(git autojump zsh-autosuggestions)

# User configuration

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/usr/local/bin:/Users/Yusuf/.fzf/bin"
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

# some more aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias cdd='cd ~/Dropbox'
alias pd='pwd'
alias up='cd ..'
alias sap='sudo apt-get install'
alias tmux='tmux -2'
alias xc='pwd | xsel -b'
alias xv='xsel -b'
alias vimf='vim $(fzf)'
alias octavet='octave --no-gui'
alias nv="nvim"
alias st="subl"
alias cds="cs /Users/Yusuf/Library/Application\ Support/Sublime\ Text\ 3/Packages/"
alias em="/usr/local/Cellar/emacs-plus/24.5/Emacs.app/Contents/MacOS/Emacs -nw"
alias emg="/usr/local/Cellar/emacs-plus/24.5/Emacs.app/Contents/MacOS/Emacs &"
alias emc="emacsclient -n"
alias rstudio='open -a Rstudio'
alias mk="open -a 'Marked 2'"

# Fucntion to find directory with fzf
function cdf () {
    cd "$(find * -type d | fzf)"
}

# Fuction to run ls after cd
function cs () {
    cd "$@" && l
    }
# Fuction to run la after cd
function ca () {
    cd "$@" && la
    }


# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# set -o vi
# bindkey -v
# bindkey fd vi-cmd-mode

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

export GIT_HOME='/usr/local/Cellar/git/2.7.0/bin'

export PATH=$GIT_HOME:$PATH
export PATH="$PATH:/Users/Yusuf/bin:/Library/TeX/Distributions/Programs/texbin/"
export PATH="$HOME/anaconda/bin:$PATH"

# for GO programmming
export GOROOT="/usr/local/go"
export GOPATH="$HOME/Dropbox/go"
export GOBIN="$HOME/Dropbox/go/bin"
export PATH="$HOME/Dropbox/go/bin:$PATH"

eval $(/usr/libexec/path_helper -s)
