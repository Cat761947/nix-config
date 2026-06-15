{ self, ... }: {
  flake.homeModules.feature-zsh = {
    programs.zsh.enable = true;
  };

  flake.homeModules.feature-zsh-noinstall = {
    imports = [ self.homeModules.feature-zsh ];
  };
}
