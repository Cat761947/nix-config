{ self, ... }: {
  flake.homeModules.fish = {
    programs.fish.enable = true;
    programs.fish.shellInit = "fish_config theme choose catppuccin-mocha";
  };

  flake.homeModules.fish-config = {
    imports = [ self.homeModules.fish ];
  };
}
