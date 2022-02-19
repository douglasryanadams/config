export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="douglasadams"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  aws
  brew
  git
  colored-man-pages
  colorize
  docker
  docker-compose
  fzf
  git
  jsontools
  macos
  python
  ripgrep
  ssh-agent
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias pip="python -m pip"
alias poetry="python -m poetry"
alias ipython="python -m ipython"
alias ls="exa"
alias ls_="/bin/ls"
alias cat="bat"
alias cat_="/bin/cat --theme gruvbox-dark"

if ! type "$(minikube version)" > /dev/null; then
  eval $(minikube docker-env)
fi

