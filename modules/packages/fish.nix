{ self, ... }: {
  flake.wrappers.fish = { config, wlib, ... }: {
    imports = [ wlib.wrapperModules.fish self.wrapperModules.config-catppuccin-flavour ];
    configFile.content = "fish_config theme choose catppuccin-${if (config.catppuccinFlavour == "latte") then "mocha --color-theme=light" else config.catppuccinFlavour}";
    flags."--no-config" = false;
  };
}
