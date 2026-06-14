{ self, ... }: {
  flake.homeModules.ghostty = {
    programs.ghostty.enable = true;
    programs.ghostty.settings = {
      auto-update = "off";
      font-family = "FiraCode Nerd Font";
      theme = "Catppuccin Mocha";
    };
  };

  flake.homeModules.ghostty-config = {
    imports = [ self.homeModules.ghostty ];
    programs.ghostty.package = null;
  };
}
