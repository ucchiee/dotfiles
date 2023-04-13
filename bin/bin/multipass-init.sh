#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

name="${1:-rootkits}"

multipass delete "$name"
multipass purge
multipass launch bionic --cpus 2 --name "$name"
multipass transfer -p ~/.ssh/github.pem "$name":/home/ubuntu/.ssh/github.pem
multipass transfer -p ~/.ssh/config "$name":/home/ubuntu/.ssh/config
multipass exec "$name" -- git clone git@github.com:ucchiee/dotfiles.git
multipass exec "$name" -- bash /home/ubuntu/dotfiles/install
multipass exec "$name" -- sudo apt update
multipass exec "$name" -- sudo apt install -y zsh
multipass exec "$name" -- mkdir -p /home/ubuntu/Code/repos
multipass exec "$name" -- zsh
