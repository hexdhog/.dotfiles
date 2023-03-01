export KEYTIMEOUT=10
export TERM="xterm-256color"
export EDITOR="$(which nvim)"
export XDG_CONFIG_HOME="${HOME}/.config"

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home"
# export M2_HOME="${HOME}/.apache-maven"


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/bison/bin:${PATH}"
# export LDFLAGS="-L/opt/homebrew/opt/bison/lib"

export PATH="/opt/homebrew/opt/flex/bin:${PATH}"
# export LDFLAGS="-L/opt/homebrew/opt/flex/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/flex/include"

export HOMEBREW_HOME="/opt/homebrew"
export PATH="${HOMEBREW_HOME}/bin:${PATH}"

export HOME_BIN="${HOME}/bin"
export PATH="${HOME_BIN}:${PATH}"

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
