{
  lib,
  self,
  ...
}: {
  flake.wrappers.ghostty = {
    wlib,
    pkgs,
    config,
    ...
  }: {
    imports = with self.wrapperModules; [
      wlib.modules.default
      config-catppuccin-flavour
      config-xdg-directories
    ];
    package = with pkgs;
      if stdenv.isDarwin
      then ghostty-bin
      else ghostty;
    flags = {
      "--config-default-files" = "false";
      "--config-file" = config.constructFiles.config.path;
    };
    flagSeparator = "=";

    constructFiles."config" = {
      content = ''
        theme = Catppuccin ${lib.toSentenceCase config.catppuccinFlavour}
        auto-update = off
        font-family = FiraCode Nerd Font
      '';
      relPath = "config";
    };
  };
}
