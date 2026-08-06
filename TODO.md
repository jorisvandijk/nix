# TODO

## Zsh

Migrate shell config to nix. Currently `~/.zshrc` and `~/.zprofile` remain in
`~/git/macbook/` and are not managed by Home Manager. Decide on approach:

- `programs.zsh` module — rewrite config declaratively in Nix (initContent,
  shellAliases, plugins, etc.)
- Symlink the existing `~/.zshrc` as-is via `home.file`

Also covers `.zprofile` (Homebrew shellenv init) — may no longer be needed
once Homebrew is fully managed by nix-homebrew.
