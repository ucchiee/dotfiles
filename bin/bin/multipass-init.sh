#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

root_dir="$(dirname $0)"
name="${1:-rootkits}"
config_content="
Host github github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
"

multipass delete "$name" && multipass purge
multipass launch bionic --cpus 2 --name "$name"
multipass exec "$name" -- ssh-keygen -N "" -t ed25519 -f /home/ubuntu/.ssh/id_ed25519
multipass transfer "$root_dir"/sshconfig_for_multipass rootkits:/home/ubuntu/.ssh/config


# Register PUBLIC_KEY
multipass exec "$name" -- cat /home/ubuntu/.ssh/id_ed25519.pub
echo -n "Register PUBLIC_KEY to github.
Press Enter when finished: "
read confirm

multipass exec "$name" -- git clone git@github.com:ucchiee/dotfiles.git
multipass exec "$name" -- bash /home/ubuntu/dotfiles/install || true
multipass exec "$name" -- sudo apt update
multipass exec "$name" -- sudo apt install -y zsh
multipass exec "$name" -- mkdir -p /home/ubuntu/Code/repos
multipass exec "$name" -- zsh
