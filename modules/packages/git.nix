{self, ...}: {
  flake.wrappers.git = {wlib, ...}: {
    imports = [wlib.wrapperModules.git self.wrapperModules.config-xdg-directories];
    settings = {
      user = {
        name = "Cat_761947";
        email = "cat_761947@noreply.codeberg.org";
      };
      init.defaultBranch = "main";
    };
  };
}
