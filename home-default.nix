{ ... }:
{
  imports = [
    ./home-git.nix
    ./home-kitty.nix
    ./home-micro.nix
    ./home-yazi.nix
    ./home-newsboat.nix
    ./home-hammerspoon.nix
    ./home-karabiner.nix
    ./home-shell.nix
  ];

  home.username = "joris";
  home.homeDirectory = "/Users/joris";
  home.stateVersion = "26.05";
}
