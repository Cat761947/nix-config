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
    wrapConfig = {catppuccinFlavour = "mocha";};

    selfpkgs = with self.packages.${pkgs.stdenv.hostPlatform.system}; {
      starship = starship.wrap wrapConfig;
      inherit git;
      tmux = tmux.wrap wrapConfig;
      neovim = neovim.wrap wrapConfig;
    };
  in {
    imports = with self.wrapperModules; [fish wlib.modules.default];

    catppuccinFlavour = wrapConfig.catppuccinFlavour;

    runtimePkgs = with selfpkgs;
      builtins.map (package: {
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

    configFile.content = with config; ''
      ${self.wrappers.fish.configFile.content}
      set -gx SHELL ${placeholder outputName}/${binDir}/${binName}
      ${lib.getExe selfpkgs.starship} init fish | source
    '';
  };
}
