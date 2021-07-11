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
- bottom
- fd
- fzf
- ncdu
- neovim
- ranger
- ripgrep
- silversearcher-ag
- tmux
  - reattach-to-user-namespace(for mac)
- universal-ctags

## Fonts

1. Download lates version of Hack.
   1. See this page : https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#quick-installation
2. Extract the files from the zip file.
3. Copy them to `~/.local/share/fonts`

## TODO

1. Write this README.
2. Change the image above (too large).
3. Write install scripts for macOS and Ubuntu.
