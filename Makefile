deploy:
	stow -d ~/dotfiles --ignore=etc */

asdf-init:
	asdf plugin add python
	asdf plugin add nodejs
	asdf install
	asdf reshim

direnv-init:
	asdf plugin-add direnv
	asdf install direnv latest
	asdf global direnv latest
