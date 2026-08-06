{ pkgs, ... }:
{
  # Global flip (not scoped via allowUnfreePredicate, by choice). The 6
  # packages that currently need it are called out in the unfree section below.
  nixpkgs.config.allowUnfree = true;

  # zsh-syntax-highlighting installs to share/zsh-syntax-highlighting, which
  # isn't under nix-darwin's default-linked share/zsh prefix (unlike
  # zsh-autosuggestions, which is), so it wouldn't otherwise appear under the
  # stable /run/current-system/sw path that .zshrc sources it from.
  environment.pathsToLink = [ "/share/zsh-syntax-highlighting" ];

  environment.systemPackages = [
    pkgs.micro

    # --- Homebrew leaves confirmed to build cleanly on aarch64-darwin ---
    # (re-verified via `nix eval` against the nixpkgs rev pinned in flake.lock)
    pkgs.bash
    pkgs.bat
    pkgs.exiftool
    pkgs.eza
    pkgs.fd
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.git
    pkgs.git-filter-repo
    pkgs.go
    pkgs.hugo
    pkgs.imagemagick
    pkgs.innoextract
    pkgs.jq
    pkgs.mpv
    pkgs.newsboat
    pkgs.p7zip
    pkgs.poppler
    pkgs.poppler-utils        # pdftoppm/pdftotext/pdfinfo — separate output from pkgs.poppler
    pkgs.python314           # brew: python@3.14
    pkgs.qpdf
    pkgs.resvg
    pkgs.ripgrep
    pkgs.rsync
    pkgs.shellcheck
    pkgs.stow
    pkgs.terminal-notifier
    pkgs.tree
    pkgs.unar
    pkgs.watch
    pkgs.wget
    pkgs.zoxide
    pkgs.zsh-autosuggestions # also needs a .zshrc source-path fix, see plan
    pkgs.zsh-syntax-highlighting
    pkgs._7zz                # brew: sevenzip
    pkgs.inetutils           # brew: telnet (bundles a telnet client, no 1:1 package)
    pkgs.android-tools       # brew cask: android-platform-tools
    pkgs."nerd-fonts".symbols-only # brew cask: font-symbols-only-nerd-font

    # --- GUI casks nixpkgs builds natively for aarch64-darwin (free license) ---
    # iina: removed entirely (uninstalled, not migrated) — no longer used.
    # karabiner-elements: staying on Homebrew, deliberately. Runs a loaded
    # DriverKit system extension plus background daemons installed outside
    # the app bundle (under /Library/Application Support/org.pqrs/...),
    # almost certainly via the Homebrew cask's privileged postinstall
    # scripts — a nixpkgs swap risks orphaning the extension/daemons or
    # forcing a re-approval dance in System Settings. Not worth the risk.
    pkgs.kitty
    pkgs.utm
    pkgs.zed-editor          # brew cask: zed (attr name differs)

    # --- In nixpkgs but unfree: needs nixpkgs.config.allowUnfree = true (set above) ---
    pkgs.unrar               # brew: carlocab/personal/unrar
    pkgs.zsh-abbr            # also needs a .zshrc source-path fix, see plan
    # cursor: removed entirely — stale cask receipt, app wasn't actually
    # installed anywhere on disk (deleted at some point, brew never noticed).
    # discord: moved to Homebrew (see homebrew.nix) — nixpkgs' Darwin build
    # extracts Discord's raw self-updater payload rather than the notarized
    # DMG build and does no code-signing of its own, so macOS reports
    # "Discord.app is damaged and can't be opened" on first launch of every
    # version. Known upstream behavior, not fixable from the nix side (see
    # nixpkgs#355950 — even vanilla `discord` hits it); Homebrew's cask
    # fetches the actual notarized build instead.
    pkgs.raycast
    pkgs.claude-code         # migrated last — see TODO.md before removing Homebrew's copy

    # --- No nixpkgs path today; stay on Homebrew ---
    # claude, cursorcerer, hammerspoon, hiddenbar, lulu, oversight,
    # pearcleaner, privadovpn: not packaged in nixpkgs.
    # gimp: packaged, but no Darwin platform in this nixpkgs pin (Linux-only).
    # cryptomator: packaged, but only x86_64-linux in this pin.
    # orion: a nixpkgs attr named "orion" exists but is an unrelated Linux-only
    # tool, not the WebKit browser — false positive, not actually available.
    # bambu-studio: packaged, but Linux-only platforms in this pin — no Darwin.
    # mole: nixpkgs has an unrelated, broken=true package with the same name
    # ("CLI application to create SSH tunnels") — no real equivalent.
    # sshfs-mac: builds fine, but only functions via macfuse (kernel extension,
    # can't be Nix-managed) — kept paired with macfuse in Homebrew.
    # macfuse: ships a kernel extension, can't be Nix-managed.
  ];
}
