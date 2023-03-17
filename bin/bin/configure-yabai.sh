#!/bin/bash

user_name=$(whoami)
yabai_hash=$(shasum -a 256 $(which yabai))

echo $user_name
echo $yabai_hash

echo "$user_name ALL=(root) NOPASSWD: sha256:$yabai_hash --load-sa" | sudo tee /private/etc/sudoers.d/yabai
