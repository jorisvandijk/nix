{ ... }:
{
  imports = [
    ./git.nix
    ./kitty.nix
    ./micro.nix
    ./yazi.nix
    ./newsboat.nix
    ./hammerspoon.nix
    ./karabiner.nix
    ./shell.nix
  ];

  home.username = "joris";
  home.homeDirectory = "/Users/joris";
  home.stateVersion = "26.05";
}
