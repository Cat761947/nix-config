{ self, lib, ... }: {
  flake.wrappers.shell-fish-main = { pkgs, wlib, ... }:
  let selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system}; in {
    imports = with self.wrapperModules; [ fish wlib.modules.default ];
    
    runtimePkgs = with pkgs; [
      neovim
      ripgrep
      tmux
      git-lfs
      tree
      fastfetch

      selfpkgs.starship
      selfpkgs.git
    ];

    configFile.content = "${self.wrappers.fish.configFile.content} \n starship init fish | source";
    
    # Temporary fix for MacOS of AppleGit taking higher priority than selfpkgs.git
    shellAliases = { git = lib.getExe selfpkgs.git; };
  };
}
