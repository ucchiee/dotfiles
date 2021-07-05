deploy:
	stow -d ~/dotfiles --ignore=etc */

asdf-init:
	asdf plugin add python
	asdf plugin add nodejs
	asdf install
	asdf reshim
