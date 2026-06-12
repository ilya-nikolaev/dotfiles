sync:
	cp -r ~/.config/hypr ./hypr
	cp -r ~/.config/nvim ./nvim

apply:
	cp -r ./hypr ~/.config/
	cp -r ./nvim ~/.config/
