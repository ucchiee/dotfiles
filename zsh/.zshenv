# zmodload zsh/zprof && zprof
export DOTFILES_DIR=$HOME/dotfiles
export ZDOTDIR=$HOME/.config/zsh
# [ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# arch specific settings
if [ "$(uname -m)" = "arm64" ]; then
  [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi
