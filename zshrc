
# Use modern completion system
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit




export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-vim-mode httpie wd pip docker ssh-agent command-not-found compleat zsh-autosuggestions zsh-completions fzf taskwarrior)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_THEME=bira

# Path to your oh-my-zsh installation.

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#VIM_MODE_VICMD_KEY='^D'
# antigen


VIM_MODE_VICMD_KEY='jk'

if [ -f ~/.ssh/tdc ]; then
    zstyle :omz:plugins:ssh-agent identities id_rsa tdc
else
    zstyle :omz:plugins:ssh-agent identities id_rsa
fi
source $ZSH/oh-my-zsh.sh




# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cat='batcat'
alias tree=/usr/bin/tree
alias k=kubectl

# myalias
alias slack='slack & disown; exit'
alias vim='nvim'
alias showpower='upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"'
alias gnome-todo="gnome-todo & disown"


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

export EDITOR=nvim
export TERM=xterm
export PATH=$PATH:~/bin
export PATH="/home/tdc/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# zsh-vim-mode
MODE_CURSOR_VIINS="#ffffff steady bar"
MODE_CURSOR_VICMD="white block"
MODE_CURSOR_SEARCH="#ffffff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #ffffff"


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=black,underline"

bindkey '^e' autosuggest-execute
bindkey '^ ' accept-line
bindkey '^L' forward-char

bindkey -M menuselect "^J" down-line-or-history
bindkey -M menuselect "^K" up-line-or-history
bindkey -M menuselect '^L' forward-char
bindkey -M menuselect '^H' backward-char
bindkey -M main "^O" reverse-menu-complete
bindkey '^B' clear-screen

figlet $USER
export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$JAVA_HOME/bin:$PATH
export JDK_HOME=${JAVA_HOME}
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}

source <(kubectl completion zsh)
source <(kubectl completion zsh | sed s/kubectl/k/g)
if [[ $HOST == "lenovo-p1" ]] | [[ $HOST == "tdc" ]]; then
    source ~/.minikube/auto_completion.sh
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
