all: sync

nvim:
	[ -f ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim

sync:
	mkdir -p ~/.config/wezterm
	mkdir -p ~/.m2
	mkdir -p ~/.config/zed

	[ -f ~/.config/wezterm/wezterm.lua ] || ln -s $(PWD)/wezterm.lua ~/.config/wezterm/wezterm.lua
	[ -f ~/.config/stylua.toml ] || ln -s $(PWD)/stylua.toml ~/.config/stylua.toml
	[ -f ~/.ideavimrc ] || ln -s $(PWD)/idea/ideavimrc ~/.ideavimrc
	[ -f ~/.atamanrc.config ] || ln -s $(PWD)/idea/atamanrc.config ~/.atamanrc.config
	[ -f ~/.vimrc ] || ln -s $(PWD)/.vimrc ~/.vimrc
	[ -f ~/.m2/settings.xml ] || ln -s $(PWD)/maven/settings.xml ~/.m2/settings.xml
	[ -f ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim
	[ -f ~/.config/fish ] || ln -s $(PWD)/fish ~/.config/fish
	[ -f ~/.gitignore ] || ln -s $(PWD)/git/gitignore ~/.gitignore
	[ -f ~/.gitconfig ] || ln -s $(PWD)/git/gitconfig ~/.gitconfig
	[ -f ~/.config/zed/settings.json ] || ln -s $(PWD)/zed/settings.json ~/.config/zed/settings.json
	[ -f ~/.config/zed/keymap.json ] || ln -s $(PWD)/zed/keymap.json ~/.config/zed/keymap.json

restore:
	mkdir -p ~/.config/wezterm
	mkdir -p ~/.m2
	mkdir -p ~/.config/zed

	# Remove symlinks first
	rm -f ~/.vimrc
	rm -rf ~/.config/nvim || rm -f ~/.config/nvim
	rm -rf ~/.config/fish || rm -f ~/.config/fish
	rm -f ~/.config/wezterm/wezterm.lua
	rm -f ~/.m2/settings.xml
	rm -f ~/.ideavimrc
	rm -f ~/.atamanrc.config
	rm -f ~/.config/stylua.toml
	rm -f ~/.gitconfig
	rm -f ~/.gitignore
	rm -f ~/.config/zed/settings.json
	rm -f ~/.config/zed/keymap.json

	# Copy files to restore them
	cp $(PWD)/wezterm.lua ~/.config/wezterm/wezterm.lua
	cp $(PWD)/stylua.toml ~/.config/stylua.toml
	cp $(PWD)/idea/ideavimrc ~/.ideavimrc
	cp $(PWD)/idea/atamanrc.config ~/.atamanrc.config
	cp $(PWD)/.vimrc ~/.vimrc
	cp $(PWD)/maven/settings.xml ~/.m2/settings.xml
	cp -r $(PWD)/nvim ~/.config/nvim
	cp -r $(PWD)/fish ~/.config/fish
	cp $(PWD)/git/gitignore ~/.gitignore
	cp $(PWD)/git/gitconfig ~/.gitconfig
	cp $(PWD)/zed/settings.json ~/.config/zed/settings.json
	cp $(PWD)/zed/keymap.json ~/.config/zed/keymap.json

clean:
	rm -f ~/.vimrc
	rm -rf ~/.config/nvim || rm -f ~/.config/nvim
	rm -rf ~/.config/fish || rm -f ~/.config/fish
	rm -f ~/.config/wezterm/wezterm.lua
	rm -f ~/.m2/settings.xml
	rm -f ~/.ideavimrc
	rm -f ~/.atamanrc.config
	rm -f ~/.config/stylua.toml
	rm -f ~/.gitconfig
	rm -f ~/.gitignore
	rm -f ~/.config/zed/settings.json
	rm -f ~/.config/zed/keymap.json

.PHONY: all clean sync restore
