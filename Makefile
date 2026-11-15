ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CONFIG ?= $(HOME)/.config
BACKUP_DIR := $(HOME)/.local/state/dotfiles-backups/$(shell date +%Y%m%d-%H%M%S)
OPENCODE_FILES := opencode.jsonc cli.json skills

.PHONY: sync apply diff require-clean

sync: require-clean
	@rsync -a --itemize-changes -- "$(CONFIG)/hypr/" "$(ROOT)/hypr/"
	@rsync -a --itemize-changes -- "$(CONFIG)/nvim/" "$(ROOT)/nvim/"
	@mkdir -p -- "$(ROOT)/opencode"
	@printf '%s\n' $(OPENCODE_FILES) | rsync -a --recursive --itemize-changes --files-from=- -- "$(CONFIG)/opencode/" "$(ROOT)/opencode/"

apply:
	@mkdir -p -- "$(CONFIG)/hypr" "$(CONFIG)/nvim" "$(CONFIG)/opencode"
	@rsync -a --itemize-changes --backup --backup-dir="$(BACKUP_DIR)/hypr" -- "$(ROOT)/hypr/" "$(CONFIG)/hypr/"
	@rsync -a --itemize-changes --backup --backup-dir="$(BACKUP_DIR)/nvim" -- "$(ROOT)/nvim/" "$(CONFIG)/nvim/"
	@printf '%s\n' $(OPENCODE_FILES) | rsync -a --recursive --itemize-changes --backup --backup-dir="$(BACKUP_DIR)/opencode" --files-from=- -- "$(ROOT)/opencode/" "$(CONFIG)/opencode/"
	@echo "Backups of overwritten files: $(BACKUP_DIR)"

diff:
	@rsync -an --itemize-changes -- "$(ROOT)/hypr/" "$(CONFIG)/hypr/"
	@rsync -an --itemize-changes -- "$(ROOT)/nvim/" "$(CONFIG)/nvim/"
	@printf '%s\n' $(OPENCODE_FILES) | rsync -an --recursive --itemize-changes --files-from=- -- "$(ROOT)/opencode/" "$(CONFIG)/opencode/"

require-clean:
	@if [ -n "$$(git -C "$(ROOT)" status --porcelain)" ]; then \
		echo "Refusing to sync: $(ROOT) has uncommitted changes."; \
		echo "Commit or stash them before syncing."; \
		exit 1; \
	fi
