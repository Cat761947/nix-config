{ self, lib, ... }: {
  flake.wrappers.shell-fish-main = { pkgs, wlib, config, ... }:
  let selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system}; in {
    imports = with self.wrapperModules; [ fish wlib.modules.default ];
    
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
      ${if pkgs.stdenv.isDarwin then "set PATH \"${lib.getBin selfpkgs.git}/bin:\$PATH\"" else ""}
      set SHELL ${placeholder config.outputName}/${config.binDir}/${config.binName}
      starship init fish | source
    '';
  };
}
