{ self, ... }: {
  flake.homeModules.feature-ghostty = {
    programs.ghostty.enable = true;
    programs.ghostty.settings = {
      auto-update = "off";
      font-family = "FiraCode Nerd Font";
      theme = "Catppuccin Mocha";
    };
  };

  flake.homeModules.feature-ghostty-noinstall = {
    imports = [ self.homeModules.feature-ghostty ];
    programs.ghostty.package = null;
  };
}
