{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Joris";
      user.email = "joris@jorisvandijk.com";
      init.defaultBranch = "main";
      core.hooksPath = "/Users/joris/.git-hooks";
    };
  };
}
