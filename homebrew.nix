{ ... }:
{
  # Homebrew migration, staged — nothing below is active yet. Uncomment
  # deliberately; adopting the existing imperative Homebrew install via
  # nix-homebrew is a one-time migration, not a routine rebuild. See the
  # Phase 2 rollout notes in the plan before flipping any of this on:
  # snapshot `brew bundle dump` first, `darwin-rebuild build` and read the
  # plan, only then `switch` with you present, then `brew doctor`.
  #
  # Verified against nix-homebrew's current README example and nix-darwin's
  # modules/homebrew.nix on the 26.05 branch.

  # nix-homebrew = {
  #   enable = true;
  #   user = "joris";
  #   enableRosetta = true;
  #   autoMigrate = true;  # adopts the existing imperative Homebrew install
  #   mutableTaps = true;  # false requires every tap below to be pinned as
  #                        # a flake input (homebrew-core/cask + the 3
  #                        # custom taps) — leave true unless you do that
  # };

  # homebrew = {
  #   enable = true;
  #   onActivation = {
  #     cleanup = "none";  # conservative first pass; "uninstall" once the
  #                        # list below is confirmed exhaustive
  #     autoUpdate = true;
  #   };
  #
  #   taps = [ "carlocab/personal" "gromgit/fuse" "olets/tap" ];
  #
  #   # micro is intentionally absent — already moved to packages.nix (pkgs.micro).
  #   brews = [
  #     "bash" "bat" "exiftool" "eza" "fd" "fzf" "git" "git-filter-repo" "go"
  #     "hugo" "imagemagick" "innoextract" "jq" "mpv" "newsboat" "p7zip"
  #     "poppler" "qpdf" "resvg" "ripgrep" "rsync" "sevenzip" "shellcheck"
  #     "stow" "telnet" "terminal-notifier" "tree" "unar" "watch" "wget"
  #     "zoxide" "zsh-autosuggestions" "zsh-syntax-highlighting"
  #   ];
  #
  #   casks = [
  #     "android-platform-tools" "bambu-studio" "claude" "claude-code"
  #     "cryptomator" "cursor" "cursorcerer" "discord"
  #     "font-symbols-only-nerd-font" "gimp" "hammerspoon" "hiddenbar" "iina"
  #     "karabiner-elements" "kitty" "lulu" "macfuse" "orion" "oversight"
  #     "pearcleaner" "privadovpn" "raycast" "utm" "zed"
  #   ];
  # };
}
