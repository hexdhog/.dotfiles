export KEYTIMEOUT=10
export TERM="xterm-256color"
export EDITOR="$(which nvim)"
export XDG_CONFIG_HOME="${HOME}/.config"

export HOME_BIN="${HOME}/bin"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home"
# export M2_HOME="${HOME}/.apache-maven"
export HOMEBREW_HOME="/opt/homebrew"
export PATH="${PATH}:${HOMEBREW_HOME}/bin"

# ZSH
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="better-cypher"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line root)
plugins=(
  git
  colored-man-pages
  #zsh-syntax-highlighting
  #vi-mode
  #zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias grep="grep --color=auto"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
