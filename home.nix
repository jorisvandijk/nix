{ config, ... }:
{
  home.username = "joris";
  home.homeDirectory = "/Users/joris";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    userName = "Joris";
    userEmail = "joris@jorisvandijk.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.hooksPath = "/Users/joris/.git-hooks";
    };
  };

  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."micro".source = ./config/micro;
  xdg.configFile."yazi/keymap.toml".source = ./config/yazi/keymap.toml;

  home.file.".newsboat/config".source = ./config/newsboat/config;
  home.file.".newsboat/urls".source = ./config/newsboat/urls;
  home.file.".hammerspoon/init.lua".source = ./config/hammerspoon/init.lua;

  xdg.configFile."zsh-abbr/user-abbreviations".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/git/nix/config/zsh-abbr/user-abbreviations";

  xdg.configFile."karabiner/karabiner.json".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/git/nix/config/karabiner/karabiner.json";
}
