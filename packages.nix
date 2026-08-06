{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.micro

    # --- Homebrew leaves confirmed to build cleanly on aarch64-darwin ---
    # (checked against nixpkgs 329c3d2a, the rev pinned in flake.lock)
    # pkgs.bash
    # pkgs.bat
    # pkgs.exiftool
    # pkgs.eza
    # pkgs.fd
    # pkgs.fzf
    # pkgs.git
    # pkgs.git-filter-repo
    # pkgs.go
    # pkgs.hugo
    # pkgs.imagemagick
    # pkgs.innoextract
    # pkgs.jq
    # pkgs.mpv
    # pkgs.newsboat
    # pkgs.p7zip
    # pkgs.poppler
    # pkgs.qpdf
    # pkgs.resvg
    # pkgs.ripgrep
    # pkgs.rsync
    # pkgs.shellcheck
    # pkgs.stow
    # pkgs.terminal-notifier
    # pkgs.tree
    # pkgs.unar
    # pkgs.watch
    # pkgs.wget
    # pkgs.zoxide
    # pkgs.zsh-autosuggestions
    # pkgs.zsh-syntax-highlighting
    # pkgs._7zz               # brew: sevenzip
    # pkgs.inetutils           # brew: telnet (bundles a telnet client, no 1:1 package)

    # --- GUI casks nixpkgs builds natively for aarch64-darwin (free license) ---
    # pkgs.iina
    # pkgs.karabiner-elements
    # pkgs.kitty
    # pkgs.utm
    # pkgs.zed

    # --- In nixpkgs but unfree: also needs nixpkgs.config.allowUnfree = true ---
    # pkgs.claude-code
    # pkgs.discord
    # pkgs.raycast
    # pkgs.bambu-studio

    # --- No nixpkgs path today; stay on Homebrew ---
    # claude, cursor, cursorcerer, hammerspoon, hiddenbar, lulu, oversight,
    # pearcleaner, privadovpn: not packaged in nixpkgs.
    # gimp, cryptomator, orion: packaged, but not built for aarch64-darwin.
    # macfuse: ships a kernel extension, can't be Nix-managed.
    # font-symbols-only-nerd-font: not a systemPackages entry — belongs in
    # fonts.nix as pkgs.nerd-fonts.symbols-only, once that file exists.
  ];
}
