[[ -n "$__ZPROFILE_LOADED" ]] && return
export __ZPROFILE_LOADED=1

if [[ $(tty) == /dev/tty* ]]; then
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
else
  export LANG=zh_CN.UTF-8
  export LC_ALL=zh_CN.UTF-8
fi

export TERM=xterm-256color
export MAILCHECK=0
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GPG_TTY=$(tty)
export NVM_DIR="$HOME/.nvm"

export XDG_DOWNLOADS_DIR="$HOME/Downloads/"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_PICTURES_DIR="$HOME/Pictures/"
export XDG_VIDEOS_DIR="$HOME/Videos/"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
