deploy:
	stow --target=${HOME} */

asdf-init:
	asdf plug add python
	asdf plug add nodejs
	asdf install
