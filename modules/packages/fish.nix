{
  flake.wrappers.fish = { wlib, ... }: {
    imports = [ wlib.wrapperModules.fish ];
    configFile.content = "fish_config theme choose catppuccin-mocha";
    flags."--no-config" = false;
  };
}
