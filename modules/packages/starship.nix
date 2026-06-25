{ self, ... }: {
  flake.wrappers.starship = { config, wlib, ... }: {
    imports = [ wlib.wrapperModules.starship self.wrapperModules.config-catppuccin-flavour ];
    preset = [ "catppuccin-powerline" ];
    settings = {
      palette = "catppuccin_${config.catppuccinFlavour}";
    };
  };
}
