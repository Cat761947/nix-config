{self, ...}: {
  flake.wrappers.fish = {
    config,
    wlib,
    ...
  }: {
    imports = with self.wrapperModules; [
      wlib.wrapperModules.fish
      config-catppuccin-flavour
      config-xdg-directories
    ];
    configFile.content = with config; "fish_config theme choose catppuccin-${
      if (catppuccinFlavour == "latte")
      then "mocha --color-theme=light"
      else catppuccinFlavour
    }";
    flags."--no-config" = false;
  };
}
