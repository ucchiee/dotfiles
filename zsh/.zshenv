# zmodload zsh/zprof && zprof
export DOTFILES_DIR=$HOME/dotfiles
export ZDOTDIR=$HOME/.config/zsh
# [ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# arch specific settings
ARCH=$(uname -m)
echo "Current Architecture: $ARCH"
if [ $ARCH = "arm64" ]; then
  [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
else
  [ -e "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
fi
