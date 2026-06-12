ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

print-root:
	@echo $(ROOT)

sync:
	rsync -a ~/.config/hypr/ $(ROOT)/hypr/
	rsync -a ~/.config/nvim/ $(ROOT)/nvim/

apply:
	cp -r $(ROOT)/hypr ~/.config/
	cp -r $(ROOT)/nvim ~/.config/
