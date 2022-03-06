export KEYTIMEOUT=10
export TERM="xterm-256color"
export EDITOR="$(which nvim)"
export XDG_CONFIG_HOME="${HOME}/.config"

export HOME_BIN="${HOME}/bin"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home"
export M2_HOME="${HOME}/.apache-maven"
export PATH="${PATH}:${M2_HOME}/bin:${HOME_BIN}"

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
