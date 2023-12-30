all: sync

sync:
	mkdir -p ~/.config/wezterm
	mkdir -p ~/.config/nvim
	mkdir -p ~/.m2

	[ -f ~/.config/wezterm/wezterm.lua ] || ln -s $(PWD)/wezterm.lua ~/.config/wezterm/wezterm.lua
	[ -f ~/.config/nvim/init.lua ] || ln -s $(PWD)/init.lua ~/.config/nvim/init.lua
	[ -f ~/.ideavimrc ] || ln -s $(PWD)/.ideavimrc ~/.ideavimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.zshenv ] || ln -s $(PWD)/.zshenv ~/.zshenv
	[ -f ~/.vimrc ] || ln -s $(PWD)/.vimrc ~/.vimrc
	[ -f ~/.m2/settings.xml ] || ln -s $(PWD)/.m2/settings.xml ~/.m2/settings.xml

clean:
	rm -f ~/.vimrc
	rm -f ~/.config/nvim/init.lua
	rm -f ~/.config/wezterm/wezterm.lua
	rm -f ~/.zshenv
	rm -f ~/.zshrc
	rm -f ~/.m2/settings.xml

.PHONY: all clean sync
