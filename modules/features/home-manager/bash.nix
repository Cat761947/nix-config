{ self, ... }: {
  flake.homeModules.feature-bash = {
    programs.bash.enable = true;
  };

  flake.homeModules.feature-bash-noinstall = {
    programs.bash.package = null;
    imports = [ self.homeModules.feature-bash ];
  };
}
