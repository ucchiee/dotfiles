deploy:
	stow --target=${HOME} */

asdf-init:
	asdf plugin add python
	asdf plugin add nodejs
	asdf install
	asdf reshim
