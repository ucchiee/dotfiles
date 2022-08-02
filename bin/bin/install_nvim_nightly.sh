#!/bin/bash

case "$(uname -s)" in
  Darwin)
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    tar xvzf nvim-macos.tar.gz
    mv ./nvim-macos/{bin,lib,share} .
    rm nvim-macos.tar.gz
  ;;
  Linux)
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    tar xvzf nvim-linux64.tar.gz
    mv ./nvim-linux/{bin,lib,share} .
    rm nvim-linux64.tar.gz
  ;;
  *) echo "Not supported OS type"
  ;;
esac

mv ./bin/nvim ./bin/nvim-nighty
