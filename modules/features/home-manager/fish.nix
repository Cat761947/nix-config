{ self, ... }: {
  flake.homeModules.feature-fish = {
    programs.fish.enable = true;
    programs.fish.shellInit = "fish_config theme choose catppuccin-mocha";
  };

  flake.homeModules.feature-fish-noinstall = {
    imports = [ self.homeModules.feature-fish ];
  };
}
