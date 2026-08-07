{ self, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "joris";
  users.users.joris.home = "/Users/joris";

  networking.hostName = "macbook";

  nix.settings.experimental-features = "nix-command flakes";

  nix.gc = {
    automatic = true;
    interval = { Hour = 4; Minute = 0; Weekday = 1; };
    options = "--delete-older-than 14d";
  };

  nix.optimise.automatic = true;

  security.pam.services.sudo_local.touchIdAuth = true;
}
