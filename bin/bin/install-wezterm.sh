#!/bin/bash

case "$(uname -s)" in
  Linux)
    rm wezterm-*.tar.xz
    rm -rf wezterm-dir
    wget https://github.com/wez/wezterm/releases/download/20230408-112425-69ae8472/wezterm-20230408-112425-69ae8472.Ubuntu20.04.tar.xz
    tar Jxfv wezterm-20230408-112425-69ae8472.Ubuntu20.04.tar.xz
    mv wezterm wezterm-dir
    ln -s /home/ucchiee/bin/wezterm-dir/usr/bin/wezterm /home/ucchiee/bin/wezterm
    rm wezterm-*.tar.xz
    ;;
  *) echo "Not supported OS type"
    ;;
esac
