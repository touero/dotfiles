if [[ $(tty) == /dev/tty* ]]; then
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
else
  export LANG=zh_CN.UTF-8
  export LC_ALL=zh_CN.UTF-8
fi

export TERM=xterm-256color
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
