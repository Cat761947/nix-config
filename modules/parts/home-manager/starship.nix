{
  flake.homeModules.starship = {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      presets = [ "catppuccin-powerline" ];
      settings = {
        palette = "catppuccin_mocha";
      };
    };
  };
}
