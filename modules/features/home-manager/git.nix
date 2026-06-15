{ self, ... }: {
  flake.homeModules.feature-git = {
    programs.git.enable = true;
    programs.git.settings = {
      user.name = "Cat_761947";
      user.email = "cat_761947@noreply.codeberg.org";
      init.defaultBranch = "main";
    };
  };

  flake.homeModules.feature-git-noinstall = {
    imports = [ self.homeModules.feature-git ];
    programs.git.package = null;
  };
}
