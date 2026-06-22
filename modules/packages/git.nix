{
  flake.wrappers.git = { wlib, ... }: {
    imports = [ wlib.wrapperModules.git ];
    settings = {
      user.name = "Cat_761947";
      user.email = "cat_761947@noreply.codeberg.org";
      init.defaultBranch = "main";
    };
  };
}
