{ self, ... }: {
  flake.homeModules.zsh = {
    programs.zsh.enable = true;
  };

  flake.homeModules.zsh-config = {
    imports = [ self.homeModules.zsh ];
  };
}
