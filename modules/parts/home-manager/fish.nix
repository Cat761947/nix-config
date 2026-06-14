{ self, ... }: {
  flake.homeModules.fish = {
    programs.fish.enable = true;
  };

  flake.homeModules.fish-config = {
    imports = [ self.homeModules.fish ];
  };
}
