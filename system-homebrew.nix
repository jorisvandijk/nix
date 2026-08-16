{ ... }:
{
  nix-homebrew = {
    enable = true;
    user = "joris";
    enableRosetta = true;
    autoMigrate = true;
    mutableTaps = true;
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "gromgit/fuse"
    ];

    brews = [
      "gromgit/fuse/sshfs-mac"
      "mole"
    ];

    casks = [
      "bambu-studio"
      "cryptomator"
      "cursorcerer"
      "discord"
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
      "reamp"
    ];
  };
}
