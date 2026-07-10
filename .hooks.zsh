autoload -Uz add-zsh-hook

function auto_venv() {
  if [[ -n "$VIRTUAL_ENV" && "$PWD" != *"${VIRTUAL_ENV:h}"* ]]; then
    deactivate
    return  
  fi

  [[ -n "$VIRTUAL_ENV" ]] && return

  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.venv/bin/activate" ]]; then
      source "$dir/.venv/bin/activate"
      return
    fi
    if [[ -f "$dir/venv/bin/activate" ]]; then
      source "$dir/venv/bin/activate"
      return
    fi
    dir="${dir:h}"
  done
}

add-zsh-hook chpwd auto_venv

# fh: fuzzy history search via fzf, pushes selected command to input buffer
fh() {
  local cmd
  cmd="$("$HOME/data/repo/dotfiles/.local/bin/fh" "$@")"
  [[ -n "$cmd" ]] && print -z "$cmd"
}
