{ self, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Default owner consumed by homebrew.user and nix-homebrew.user (homebrew.nix).
  system.primaryUser = "joris";
}
