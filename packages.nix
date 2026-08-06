{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [ "/share/zsh-syntax-highlighting" ];

  environment.systemPackages = [
    pkgs._7zz
    pkgs.android-tools
    pkgs.bash
    pkgs.bat
    pkgs.claude-code
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
    pkgs.inetutils
    pkgs.innoextract
    pkgs.jq
    pkgs.kitty
    pkgs.micro
    pkgs.mpv
    pkgs."nerd-fonts".symbols-only
    pkgs.newsboat
    pkgs.p7zip
    pkgs.poppler
    pkgs.poppler-utils
    pkgs.python314
    pkgs.qpdf
    pkgs.raycast
    pkgs.resvg
    pkgs.ripgrep
    pkgs.rsync
    pkgs.shellcheck
    pkgs.stow
    pkgs.terminal-notifier
    pkgs.tree
    pkgs.unar
    pkgs.unrar
    pkgs.utm
    pkgs.watch
    pkgs.wget
    pkgs.zed-editor
    pkgs.zoxide
    pkgs.zsh-abbr
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
  ];
}
