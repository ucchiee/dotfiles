#!/bin/bash

git_dir=$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)
fonts_dir=${git_dir}/fonts

if [ ! -d "$fonts_dir" ]; then
	mkdir "$fonts_dir"
fi

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
unzip -u JetBrainsMono.zip \
  "JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono.ttf" \
  "JetBrains\ Mono\ Italic\ Nerd\ Font\ Complete\ Mono.ttf" \
  "JetBrains\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono.ttf" \
  "JetBrains\ Mono\ Bold\ Italic\ Nerd\ Font\ Complete\ Mono.ttf" \
  -d "$fonts_dir"

rm JetBrainsMono.zip
