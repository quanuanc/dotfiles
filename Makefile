all: sync

sync:
	mkdir -p ~/.config/wezterm
	mkdir -p ~/.m2

	[ -f ~/.config/wezterm/wezterm.lua ] || ln -s $(PWD)/wezterm.lua ~/.config/wezterm/wezterm.lua
	[ -f ~/.config/stylua.toml ] || ln -s $(PWD)/stylua.toml ~/.config/stylua.toml
	[ -f ~/.ideavimrc ] || ln -s $(PWD)/.ideavimrc ~/.ideavimrc
	[ -f ~/.atamanrc.config ] || ln -s $(PWD)/.atamanrc.config ~/.atamanrc.config
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.zshenv ] || ln -s $(PWD)/.zshenv ~/.zshenv
	[ -f ~/.vimrc ] || ln -s $(PWD)/.vimrc ~/.vimrc
	[ -f ~/.m2/settings.xml ] || ln -s $(PWD)/.m2/settings.xml ~/.m2/settings.xml
	[ -f ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim

clean:
	rm -f ~/.vimrc
	rm -rf ~/.config/nvim || rm -f ~/.config/nvim
	rm -f ~/.config/wezterm/wezterm.lua
	rm -f ~/.zshenv
	rm -f ~/.zshrc
	rm -f ~/.m2/settings.xml
	rm -f ~/.ideavimrc
	rm -f ~/.atamanrc.config
	rm -f ~/.config/stylua.toml

.PHONY: all clean sync
