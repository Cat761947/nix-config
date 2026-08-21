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
    wrapConfig = {inherit (config) catppuccinFlavour;};

    selfpkgs = with self.packages.${pkgs.stdenv.hostPlatform.system}; {
      starship = starship.wrap wrapConfig;
      inherit git;
      tmux = tmux.wrap wrapConfig;
      neovim = neovim.wrap wrapConfig;
    };
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

        starship
        git
        tmux
        neovim
      ];

    configFile.content = ''
      ${self.wrappers.fish.configFile.content}
      ${lib.getExe selfpkgs.starship} init fish | source
    '';
  };
}
