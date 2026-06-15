{ self, ... }: {
  flake.homeModules.feature-starship = {
    programs.starship = {
      enable = true;
      presets = [ "catppuccin-powerline" ];
      settings = {
        palette = "catppuccin_mocha";
      };
    };
  };

  flake.homeModules.feature-starship-noinstall = {
    imports = [ self.homeModules.feature-starship ];
  };
}
