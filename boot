#!/bin/bash
# author: weiensong
# email: touer0018@gmail.com
# install_packages: install packages in diff platform

is_installed() {
  command -v "$1" &>/dev/null
}

default_shell_setting() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
  fi
}

git_info_setting() {
  if ! git config --global user.name &>/dev/null; then
    echo "Git configuring..."
    git config --global user.name "touero"
    git config --global user.email "touer0018@gmail.com"
    git config --global color.ui auto
    git config --global diff.tool nvimdiff
    git config --global difftool.prompt false
    git config --global sendemail.suppresscc self
    git config --global delta.navigate true
    git config --global delta.line-numbers true
    git config --global delta.side-by-side true
    git config --global delta.syntax-theme gruvbox-dark
  fi
}

install_zim() {
  local ZIM_HOME="${ZIM_HOME:-$HOME/.zim}"
  if [ ! -d "$ZIM_HOME" ]; then
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  fi
}

install_starship() {
  if ! is_installed starship; then
    curl -sS https://starship.rs/install.sh | sh
  fi
}

install_pyenv() {
  if ! is_installed pyenv; then
    curl -fsSL https://pyenv.run | bash
  fi
}

default_shell_setting
git_info_setting
install_zim
install_starship
install_pyenv
