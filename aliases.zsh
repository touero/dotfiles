alias vim='nvim'
alias rm='rm -IR'
alias zshconfig="$EDITOR ~/.zshrc"
alias lg='lazygit'
alias frp_on='nohup /home/weiensong/Apps/frp_0.61.0_linux_amd64/frpc -c /home/weiensong/Apps/frp_0.61.0_linux_amd64/frpc.toml > /home/weiensong/Apps/frp_0.61.0_linux_amd64/frpc.log 2>&1 &'
alias frp_off="ps aux | grep frp | grep -v grep | sort -k 9 | head -n 1 | awk '{print \$2}' | xargs kill -9"
alias ra='ranger'
alias sa='yazi'
alias ls='lsd'
alias tlst='f() { tail -f -n ${1:-300} "$(ls -t | head -n1)"; unset -f f; }; f'
alias gau='git update-index --assume-unchanged'
alias gnau='git update-index --no-assume-unchanged'
alias gaus="git ls-files -v | grep '^[a-z]'"
alias gl='git log --graph --pretty=format:"%Cred%h%Creset%C(yellow)%d%Creset %s %Cblue%an %C(cyan)%ad%Creset" --abbrev-commit --date=iso'
alias tmuxd='pgrep -x tmux || tmux attach || tmux'
alias syshn="swaylock -f & sleep 1 && systemctl hibernate"
alias syssp="swaylock -f & sleep 1 && systemctl suspend"
alias docker1='NUM=1; eval ssh -p 2222 -o ServerAliveInterval=30 shoot@$SGJ'
alias docker2='NUM=2; eval ssh -p 2223 -o ServerAliveInterval=30 shoot@$SGJ'
for ((i=3; i<=15; i++)); do
    port=$((2222 + i))
    eval "alias docker$i='NUM=$i; eval ssh -p $port -o ServerAliveInterval=30 shoot@\$SGJ'"
done
alias .d="cd $HOME/Downloads"
alias .m="cd $HOME/Mail"
alias .p="cd $HOME/Pictures"
alias .v="cd $HOME/Videos"
alias .c="cd $HOME/.config"
alias .lb="cd $HOME/.local/bin"
alias .ls="cd $HOME/.local/share"
alias .df="cd $HOME/data/repo/dotfiles"
