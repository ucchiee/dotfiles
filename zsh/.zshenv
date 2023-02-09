# zmodload zsh/zprof && zprof
export DOTFILES_DIR=$HOME/dotfiles
export ZDOTDIR=$HOME/.config/zsh
# [ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Set PATH, MANPATH, etc., for Homebrew.
if [[ -e "/opt/homebrew/bin/brew" && $(uname -m) == "arm64" ]];then 
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
