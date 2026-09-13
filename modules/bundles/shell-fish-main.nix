{
  self,
  lib,
  ...
}: {
  flake.wrappers.shell-fish-main = {
    pkgs,
    wlib,
    config,
    ...
  }: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};

    wrapConfig = pkg: pkg.wrap {inherit (config) catppuccinFlavour;};
  in {
    imports = with self.wrapperModules; [fish wlib.modules.default];

    catppuccinFlavour = "mocha";

    runtimePkgs = with selfpkgs;
      map (package: {
        data = package;
        prefix = true;
      }) [
        pkgs.git-lfs
        pkgs.tree
        pkgs.fastfetch

        (wrapConfig starship)
        git
        (wrapConfig tmux)
        (wrapConfig neovim)
      ];

    configFile.content = ''
      ${self.wrappers.fish.configFile.content}
      ${lib.getExe selfpkgs.starship} init fish | source
    '';
  };
}
