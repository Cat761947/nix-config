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

    configFile.content = "${self.wrappers.fish.configFile.content} \n set SHELL ${placeholder config.outputName}/${config.binDir}/${config.binName} \n starship init fish | source";

    # Temporary fix for MacOS where AppleGit takes higher priority than selfpkgs.git
    shellAliases = if pkgs.stdenv.isDarwin then { git = lib.getExe selfpkgs.git; } else {};
  };
}
