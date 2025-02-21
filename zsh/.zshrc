export KEYTIMEOUT=10
export TERM="xterm-256color"
export EDITOR="$(which nvim)"
export XDG_CONFIG_HOME="${HOME}/.config"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HOMEBREW_HOME="/opt/homebrew"
export PIO_BIN="${HOME}/.platformio/penv/bin"
export HOME_BIN="${HOME}/bin"
export PATH="$HOME/.cargo/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/bison/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/flex/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/bin:${HOMEBREW_HOME}/opt:${HOME_BIN}:${PIO_BIN}:${PATH}"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# ruby setup (from jekyll install guide)
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.4.1

# ZSH
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_THEME="better-cypher"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line root)
plugins=(
  git
  colored-man-pages
  # zsh-syntax-highlighting
  vi-mode
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias grep="grep --color=auto"
alias nv="nvim"
alias m68k="wine EDIT68K.exe"
