#!/bin/bash

case "$(uname -s)" in
  Darwin)
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    rm -rf nvim-macos
    tar xvzf nvim-macos.tar.gz
    mv ./nvim-macos ./nvim-dev
    rm nvim-macos.tar.gz
  ;;
  Linux)
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    rm -rf nvim-linux
    tar xvzf nvim-linux64.tar.gz
    mv ./nvim-linux ./nvim-dev
    rm nvim-linux64.tar.gz
  ;;
  *) echo "Not supported OS type"
  ;;
esac

ln -sf ./nvim-dev/bin/nvim ndev
