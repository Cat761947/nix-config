{ self, ... }: {
  flake.wrappers.starship = { config, wlib, ... }: {
    imports = [ wlib.wrapperModules.starship self.wrapperModules.catppuccin-flavour-config ];
    preset = [ "catppuccin-powerline" ];
    settings = {
      palette = "catppuccin_${config.catppuccinFlavour}";
    };
  };
}
