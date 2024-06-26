# dotfiles

A collection of the dotfiles I need to remain sane when using \*NIX.

![UIE](./screenshot.png)

## Dependency

- `python`
- `git`

## How to install

1. Deploy the files:

```sh
git clone https://github.com/ucchiee/dotfiles ~/dotfiles && cd ~/dotfiles && ./install
```

2. Restart your `zsh` (if you're using `zsh`).

3. (Optional) Enable Python and Nodejs using asdf:

```
asdf plugin add python
asdf plugin add nodejs
asdf install
asdf reshim
```

(Now you can use neovim as well !)

## Useful Tools

- alacritty
- asdf
- bat
- bottom
- entr
- fd
- fzf
- git-delta
- lazygit
- lazydocker
- ncdu
- neovim
- pngpaste
- ranger
- ripgrep
- ripgrep-all
- silversearcher-ag
- tmux
  - reattach-to-user-namespace(for mac)
  - tmuxp
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

## OS specific setting

### MacOS

Speeds up key repeat:

```
defaults write -g KeyRepeat -int 1.3
```

Romaji-Hiragana:

- "日本語 - ローマ字入力" > "入力モード" で "英字" にチェックを入れる。
  - Hammerspoon を利用した Command による IME の切り替えを有効にするために必要。
