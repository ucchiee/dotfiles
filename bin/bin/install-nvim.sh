#!/bin/bash

case "$(uname -s)" in
  Darwin)
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
    rm -rf nvim-macos nvim-stable
    tar xvzf nvim-macos.tar.gz
    mv ./nvim-macos ./nvim-stable
    rm nvim-macos.tar.gz
  ;;
  Linux)
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
    rm -rf nvim-linux nvim-stable
    tar xvzf nvim-linux64.tar.gz
    mv ./nvim-linux64 ./nvim-stable
    rm nvim-linux64.tar.gz
  ;;
  *) echo "Not supported OS type"
  ;;
esac

ln -sf ./nvim-stable/bin/nvim nvim
