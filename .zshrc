#export TERM="xterm-256color"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

export PATH="$HOME/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# load zgen
source "${HOME}/.zsh/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen load chrissicool/zsh-256color
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/git-extras
    #zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    #zgen oh-my-zsh plugins/cabal
    zgen oh-my-zsh plugins/dirhistory
    #zgen oh-my-zsh plugins/vi-mode
    zgen load sharat87/zsh-vim-mode
    zgen load rupa/z
    zgen load joel-porquet/zsh-dircolors-solarized

    #zgen load /path/to/super-secret-private-plugin

    # completions
    zgen load ehamberg/zsh-cabal-completion

    # load this last:
    zgen load zsh-users/zsh-completions src

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
#    zgen load tarruda/zsh-autosuggestions

    # theme
    #zgen oh-my-zsh themes/agnoster
    #zgen load bhilburn/powerlevel9k powerlevel9k

    # save all to init script
    zgen save
fi

#ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%m: %~"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status)
#DEFAULT_USER=dan
#POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=4
#POWERLEVEL9K_DIROPT="-1<...<%"
POWERLEVEL9K_DIROPT="60<...<%"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_COLOR_SCHEME='dark'
source ~/.zsh/dbb_powerline.zsh

setupsolarized dircolors.ansi-${POWERLEVEL9K_COLOR_SCHEME}
# set completions colors same as dircolors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

# Setup zsh-autosuggestions
# Enable autosuggestions automatically
#zle-line-init() {
#    zle autosuggest-start
#}

#zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
#bindkey '^T' autosuggest-toggle

#AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=10'
#AUTOSUGGESTION_HIGHLIGHT_CURSOR=0
