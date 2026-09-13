{
  lib,
  self,
  ...
}: {
  flake.wrappers.ghostty = {
    wlib,
    config,
    ...
  }: {
    imports = with self.wrapperModules; [
      wlib.wrapperModules.ghostty
      config-catppuccin-flavour
      config-xdg-directories
    ];
    settings = {
      auto-update = "off";
      font-family = "FiraCode Nerd Font";
      theme = "Catppuccin ${lib.toSentenceCase config.catppuccinFlavour}";
    };

    prefixVar = [["PATH" ":" "${placeholder config.outputName}${config.wrapperPaths.relDir}"]];
  };
}
