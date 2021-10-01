# dotfiles

A collection of the dotfiles I need to remain sane when using \*NIX.

![UIE](./screenshot.png)

## How to install

```sh
git clone https://github.com/ucchiee/dotfiles ~/dotfiles
stow -d ~/dotfiles --ignore=etc */
```

## Useful Tools

- alacritty
- asdf
- bat
- bottom
- fd
- fzf
- git-delta
- lazygit
- lazydocker
- ncdu
- neovim
- ranger
- ripgrep
- silversearcher-ag
- tmux
  - reattach-to-user-namespace(for mac)
- universal-ctags

## Fonts

See the link below for more information. I recommend you to use `Hack Nerd Font`.

https://github.com/ryanoasis/nerd-fonts

### Hack Nerd Font ( Ubuntu )

1. Download latest version of Hack.
   1. See this page : https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#quick-installation
2. Extract the files from the zip file.
3. Copy them to `~/.local/share/fonts`

### Hack Nerd Font ( MacOS )

```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

If you have installed nerd-fonts, reinstall them like this:

```
brew reinstall font-hack-nerd-font
```

## TODO

1. Write this README.
   1. Write about zsh and its plugin manager.
   2. Write about alacritty config (especially about fonts).
2. Change the image above (too large).
3. Make tmux config better and easy to read.
