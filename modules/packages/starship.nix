{self, ...}: {
  flake.wrappers.starship = {
    config,
    wlib,
    ...
  }: {
    imports = with self.wrapperModules; [
      wlib.wrapperModules.starship
      config-catppuccin-flavour
      config-xdg-directories
    ];
    preset = ["catppuccin-powerline"];
    settings = {
      palette = "catppuccin_${config.catppuccinFlavour}";
    };
  };
}
