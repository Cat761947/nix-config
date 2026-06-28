{
  self,
  lib,
  ...
}: {
  flake.wrappers.terminal-ghostty-main = {
    pkgs,
    config,
    ...
  }: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [self.wrapperModules.ghostty];
    runtimePkgs = [
      {
        data = selfpkgs.shell-fish-main;
        prefix = true;
      }
    ];
    flags."--command" = lib.getExe selfpkgs.shell-fish-main;
    catppuccinFlavour = self.wrappers.shell-fish-main.catppuccinFlavour;
    prefixVar = [["PATH" ":" "${placeholder config.outputName}/bin"]];
  };
}
