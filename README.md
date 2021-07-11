# dotfiles

A collection of the dotfiles I need to remain sane when using \*NIX.

![UIE](./screenshot.png)

## How to install

```sh
git clone git@github.com:ucchiee/dotfiles.git ~/dotfiles
stow -d ~/dotfiles --ignore=etc */
```

You can also install useful tools.

```sh
pip install ranger-fm
```

## Useful Tools

- alacritty
- asdf
- fd
- fzf
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

See the link below for more information.

https://github.com/ryanoasis/nerd-fonts

### Linux

1. Download latest version of Hack.
   1. See this page : https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#quick-installation
2. Extract the files from the zip file.
3. Copy them to `~/.local/share/fonts`

**NOTE**: In Linux these fonts can be specified by `Hack`

### MacOS

```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

If you have installed nerd-fonts, reinstall them like this:

```
brew reinstall font-hack-nerd-font
```

**NOTE**: In Linux these fonts can be specified by `Hack Nerd Font`

## TODO

1. Write this README.
2. Change the image above (too large).
3. Write install scripts for macOS and Ubuntu.
