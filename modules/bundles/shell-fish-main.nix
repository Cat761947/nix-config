{ self, lib, ... }: {
  flake.wrappers.shell-fish-main = { pkgs, wlib, config, ... }:
  let
    wrapConfig = { catppuccinFlavour = "mocha"; };

    selfpkgs = with self.packages.${pkgs.stdenv.hostPlatform.system}; {
      starship = starship.wrap wrapConfig;
      inherit git;
      tmux = tmux.wrap wrapConfig;
      neovim = neovim.wrap wrapConfig;
    };
  in {
    imports = with self.wrapperModules; [ fish wlib.modules.default ];

    catppuccinFlavour = wrapConfig.catppuccinFlavour;

    runtimePkgs = with pkgs; builtins.map (package: { data = package; prefix = true; }) [
      git-lfs
      tree
      fastfetch

      selfpkgs.starship
      selfpkgs.git
      selfpkgs.tmux
      selfpkgs.neovim
    ];

    configFile.content = 
    ''
      ${self.wrappers.fish.configFile.content}
      set -gx SHELL ${placeholder config.outputName}/${config.binDir}/${config.binName}
      ${lib.getExe selfpkgs.starship} init fish | source
    '';
  };
}
