{ self, ... }: {
  flake.homeModules.bash = {
    programs.bash.enable = true;
  };

  flake.homeModules.bash-config = {
    programs.bash.package = null;
    imports = [ self.homeModules.bash ];
  };
}
