STOW_PKGS := git gnupg karabiner kitty neovim shell ssh

.PHONY: stow
stow:
	stow --no-folding --dir stows --target ~/ --stow $(STOW_PKGS)

.PHONY: unstow
unstow:
	stow --no-folding --dir stows --target ~/ --delete $(STOW_PKGS)
