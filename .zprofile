[[ -n "$__ZPROFILE_LOADED" ]] && return
export __ZPROFILE_LOADED=1

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export LC_MESSAGES=en_US.UTF-8

export TERM=xterm-256color
export MAILCHECK=0
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$HOME/.bun/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export NVM_DIR="$HOME/.nvm"
export MENU="$HOME/.local/bin/menu"

export XDG_DOWNLOADS_DIR="$HOME/Downloads/"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_PICTURES_DIR="$HOME/Pictures/"
export XDG_VIDEOS_DIR="$HOME/Videos/"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [[ -z "$WAYLAND_DISPLAY" && $(tty) == /dev/tty1 ]]; then
    exec sway
fi
