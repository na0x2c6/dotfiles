# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nao/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/nao/.fzf/bin"
fi

eval "$(fzf --zsh)"
