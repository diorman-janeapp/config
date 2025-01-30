STOW_PKGS := git gnupg karabiner kitty neovim shell ssh

.PHONY: stow
stow:
	stow --no-folding --dir stow --target ~/ --stow $(STOW_PKGS)

.PHONY: unstow
unstow:
	stow --no-folding --dir stow --target ~/ --delete $(STOW_PKGS)
