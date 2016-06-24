.PHONY: Help \
		dotfiles \
		brews \
		ensure-location \
        install-npm-modules \
		install-configs \
		install-configs-git \
		install-fonts \
		install-prezto \
		update-submodules
help:
	@echo "Usage: make <command>"
	@echo
	@echo "    brews  Install homebrew, brew tools, and casks"
	@echo "    dotfiles  Install fonts, dotfiles, zsh (prezto) as default shell etc."
	@echo

dotfiles: ensure-location update-submodules install-configs install-fonts install-prezto default-zsh
	@echo "Remember to also configure iterm2 to use powerline fonts"
	@echo

brews:
	sh $(shell pwd)/brews/install.sh
	@echo

ensure-location:
ifneq "$(shell pwd)" "$(HOME)/.dotfiles"
	@echo
	@echo 'Must be run from $(HOME)/.dotfiles'
	@echo 'Suggest cloning repo to $(HOME)/.dotfiles'
	@echo
	exit 1
endif

install-npm-modules:
    sh $(shell pwd)/npm/install.sh

install-configs: install-configs-git install-shared-dotfiles

install-configs-git:
	ln -sfn $(shell pwd)/git/gitconfig $(HOME)/.gitconfig

install-shared-dotfiles:
	ln -sfn $(shell pwd)/shared/aliases $(HOME)/.aliases
	ln -sfn $(shell pwd)/shared/powerline-shell.py $(HOME)/.powerline-shell.py

install-fonts:
	sh $(shell pwd)/fonts/powerline-fonts/install.sh

install-prezto: update-submodules

	for runcom in $(shell find $(shell pwd)/zsh/prezto/runcoms -type f -name 'z*'); do \
		r=$$(basename $$runcom); \
	  ln -sfn $$runcom $(HOME)/.$$r; \
	done

	ln -sfn $(shell pwd)/zsh/zpreztorc $(HOME)/.zpreztorc
	ln -sfn $(shell pwd)/zsh/zshrc $(HOME)/.zshrc
	ln -sfn $(shell pwd)/zsh/prezto $(HOME)/.zprezto

default-zsh:
	chsh -s /bin/zsh

update-submodules:
	git submodule update --init --recursive
