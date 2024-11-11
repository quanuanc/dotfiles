all: sync

sync:
	mkdir -p ~/.config/wezterm
	mkdir -p ~/.m2

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

.PHONY: all clean sync
