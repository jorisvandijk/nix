# TODO — manual follow-ups from the Homebrew → nixpkgs migration

Things that need action from Joris (not automatable / needs a live check), tracked here so they don't get lost.

## kitty

The nix-provided `kitty` is installed and active (`packages.nix`), but it lives at
`/Applications/Nix Apps/kitty.app` — a different path than Homebrew's copy at
`/Applications/kitty.app`. Homebrew's copy has **not** been removed yet, on purpose,
since this exact terminal session is running inside it (`KITTY_WINDOW_ID=2`).

- [x] Open a **new** Kitty window from `/Applications/Nix Apps/kitty.app` and confirm
      it works as expected (fonts, config at `~/.config/kitty`, keybindings, etc.)
- [x] If it looks good, tell Claude to remove the Homebrew copy
      (`brew uninstall --cask kitty`, plus dropping `pkgs.kitty`'s now-redundant
      Homebrew declaration — already done, just the actual uninstall is pending)
- [ ] ~~Re-pin Kitty in the Dock~~ — not applicable, user doesn't use the Dock

## raycast

Same situation as kitty: `pkgs.raycast` is installed and active, at
`/Applications/Nix Apps/Raycast.app`, but Homebrew's `/Applications/Raycast.app` is
still running (PID was live, hotkey bindings/extensions in memory) so it was left
in place rather than force-quit.

- [x] Quit Raycast, then launch it from `/Applications/Nix Apps/Raycast.app` and
      confirm your hotkey, extensions, and settings all still work
- [x] If it looks good, tell Claude to remove the Homebrew copy
      (`brew uninstall --cask raycast` — done; note it also silently deleted
      the login item, matched by name rather than path — re-added below)
- [x] Re-check "Launch at Login" is still enabled for the new path if you had
      that on (Homebrew's uninstall wiped it; re-created pointing at
      `/Applications/Nix Apps/Raycast.app`)
- [ ] ~~Re-pin Raycast in the Dock~~ — not applicable, user doesn't use the Dock

## claude-code

`pkgs.claude-code` is installed and active at `/run/current-system/sw/bin/claude`
(verified working directly, version 2.1.187). Homebrew's copy is untouched.

This one's more involved than kitty/raycast: `claude` currently resolves via
`~/.local/bin/claude`, which is a **symlink** to `/opt/homebrew/bin/claude` →
Homebrew's Caskroom copy — and `~/.local/bin` sits *first* in `$PATH`, ahead of
`/run/current-system/sw/bin`. So even with Homebrew's cask uninstalled, `claude`
won't resolve to the nix version until that symlink itself is repointed or removed.

Also note: nixpkgs currently has claude-code **2.1.187**, older than the
**2.1.212** Homebrew had installed. Decide if that's acceptable before switching over
(a newer nixpkgs revision will eventually catch up).

- [x] In a **new** terminal window, run `/run/current-system/sw/bin/claude --version`
      to confirm the nix build still works standalone
- [x] When ready to cut over: `rm ~/.local/bin/claude && ln -s /run/current-system/sw/bin/claude ~/.local/bin/claude`
      (chose to cut over despite nixpkgs (2.1.187) trailing Homebrew's prior
      2.1.212 — accepted knowingly)
- [x] Open a fresh terminal, confirm `which claude` resolves to the nix path and
      `claude` launches correctly
- [x] Only then: tell Claude to `brew uninstall --cask claude-code` (done — note
      this is a distinct cask from `claude`, the Claude desktop app, which stays
      on Homebrew and is unaffected)
