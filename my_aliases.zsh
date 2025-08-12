alias vim='nvim'

alias rm='rm -IR'

alias zshconfig="$EDITOR ~/.zshrc"

alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

alias lg='lazygit'

alias frp_on='nohup /home/weiensong/Apps/frp_0.61.0_linux_amd64/frpc -c /home/weiensong/Apps/frp_0.61.0_linux_amd64/frpc.toml > /home/weiensong/Apps/frp_0.61.0_linux_amd64/frpc.log 2>&1 &'

alias frp_off="ps aux | grep frp | grep -v grep | sort -k 9 | head -n 1 | awk '{print \$2}' | xargs kill -9"


alias ubuntu='ssh -p $UBUNTU_SSH_PORT -o ServerAliveInterval=30 ubuntu@$UBUNTU_IP'

alias ra='ranger'

alias sa='yazi'

alias ls='lsd'

alias tlst='f() { tail -f -n ${1:-300} "$(ls -t | head -n1)"; unset -f f; }; f'

alias docker1='ssh -p 2222 -o ServerAliveInterval=30 shoot@$COMPANY_DOCKER_IP'

alias docker2='ssh -p 2223 -o ServerAliveInterval=30 shoot@$COMPANY_DOCKER_IP'

for ((i=3; i<=15; i++)); do
    port=$((2222 + i))
    eval "alias docker$i='ssh -p $port -o ServerAliveInterval=30 shoot@\$COMPANY_DOCKER_IP'"
done

alias gau='git update-index --assume-unchanged'

alias gnau='git update-index --no-assume-unchanged'

alias gaus="git ls-files -v | grep '^[a-z]'"

alias gl='git log --graph --pretty=format:"%Cred%h%Creset%C(yellow)%d%Creset %s %Cblue%an %C(cyan)%ad%Creset" --abbrev-commit --date=iso'
