{
  flake.wrappers.starship = { wlib, ... }: {
    imports = [ wlib.wrapperModules.starship ];
    preset = [ "catppuccin-powerline" ];
    settings = {
      palette = "catppuccin_mocha";
    };
  };
}
