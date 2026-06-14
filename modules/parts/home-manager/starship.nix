{ self, ... }: {
  flake.homeModules.starship = {
    programs.starship = {
      enable = true;
      presets = [ "catppuccin-powerline" ];
      settings = {
        palette = "catppuccin_mocha";
      };
    };
  };

  flake.homeModules.starship-config = {
    imports = [ self.homeModules.starship ];
  };
}
