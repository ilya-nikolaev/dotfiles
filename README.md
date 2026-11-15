# dotfiles

## Hyprland

- 4K monitor, 160Hz
- NVIDIA GPU
- `dunst` for notifications
- `hyprpaper` for wallpapers
- `hyprpolkit-agent`

## NeoVim

Simple nvim config

## OpenCode

Tracked OpenCode files live in `opencode/`:

- `opencode.jsonc` — main config
- `cli.json` — UI settings
- `skills/` — reusable skills

Local-only files such as `service.json` and `node_modules/` are not tracked and
are never copied by `make sync` or `make apply`.

## Use

- `make diff` — preview changes that `make apply` would make
- `make sync` — copy configs from system to repo; refuses if the repo has
  uncommitted changes
- `make apply` — copy configs from repo to system; overwritten files are backed
  up to `~/.local/state/dotfiles-backups/<timestamp>/`

`sync` and `apply` never delete files that are missing on the other side.
