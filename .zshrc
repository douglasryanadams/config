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
alias ipython="python -m IPython"
alias ls="eza"
alias ls_="/bin/ls"
alias cat="bat --paging=never --theme OneHalfDark --style plain,grid"
alias cat_="/bin/cat"
alias grep="rg"
alias grep_="/usr/bin/grep"
alias du="dust"
alias du_="/usr/local/opt/coreutils/libexec/gnubin/du"
alias diff="delta"
alias df="duf"
alias df_="/usr/local/opt/coreutils/libexec/gnubin/df"
alias ping="gping"
alias ping_="/sbin/ping"
alias curl="curlie"
alias curl_="/usr/bin/curl"

function grab_raw {
  ls *.JPG | sed -E 's#(.+)\.JPG#"/Volumes/NIKON Z 5  /DCIM/100NCZ_5/\1.NEF"#' | xargs -I{} cp {} .
}


export PATH="/usr/local/opt/ruby/bin:$PATH"
