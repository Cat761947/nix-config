{ self, lib, ... }: {
  flake.wrappers.shell-fish-main = { pkgs, wlib, config, ... }:
  let
    wrapConfig = { catppuccinFlavour = "mocha"; };

    selfpkgs = with self.packages.${pkgs.stdenv.hostPlatform.system}; {
      starship = starship.wrap wrapConfig;
      inherit git;
      tmux = tmux.wrap wrapConfig;
    };
  in {
    imports = with self.wrapperModules; [ fish wlib.modules.default ];

    catppuccinFlavour = wrapConfig.catppuccinFlavour;

    runtimePkgs = with pkgs; [
      neovim
      ripgrep
      git-lfs
      tree
      fastfetch

      selfpkgs.starship
      selfpkgs.git
      selfpkgs.tmux
    ];

    configFile.content = 
    ''
      ${self.wrappers.fish.configFile.content}
      # Line below fixes Apple Git overriding selfpkgs.git
      ${if pkgs.stdenv.isDarwin then "set -gxp PATH ${lib.getBin selfpkgs.git}/bin" else ""}
      set -gx SHELL ${placeholder config.outputName}/${config.binDir}/${config.binName}
      starship init fish | source
    '';
  };
}
