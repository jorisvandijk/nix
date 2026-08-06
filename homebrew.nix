{ ... }:
{
  # Homebrew is Nix-managed via nix-homebrew (adopted the pre-existing
  # imperative install) and declared here. Only what genuinely can't move to
  # nixpkgs stays in this file — see packages.nix for what already migrated
  # and why the rest is here (kernel extensions, unpackaged casks, etc).

  nix-homebrew = {
    enable = true;
    user = "joris";
    enableRosetta = true;
    autoMigrate = true;  # adopted the pre-existing imperative Homebrew install
    mutableTaps = true;  # false would require the tap below to be pinned as
                         # a flake input instead — leave true unless you do that
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "none";  # conservative first pass; "uninstall" once the
                         # list below is confirmed exhaustive
      autoUpdate = true;
    };

    taps = [
      "gromgit/fuse"
    ];

    # sshfs-mac: builds fine via nixpkgs too, but only functions via macfuse
    # (kernel extension, can't be Nix-managed) — kept paired with it here.
    # mole: nixpkgs has an unrelated, broken=true package with the same name.
    # Non-core formulae need the tap-qualified name (`brew bundle dump`'s own
    # convention) — short names don't resolve even with the tap trusted.
    brews = [
      "gromgit/fuse/sshfs-mac"
      "mole"
    ];

    casks = [
      "bambu-studio"
      "claude"
      "cryptomator"
      "cursorcerer"
      "discord"  # nixpkgs' Darwin build fails Gatekeeper on every version
                 # bump ("is damaged") — see packages.nix for details
      "gimp"
      "hammerspoon"
      "hiddenbar"
      "karabiner-elements"
      "lulu"
      "macfuse"
      "orion"
      "oversight"
      "pearcleaner"
      "privadovpn"
    ];
  };
}
