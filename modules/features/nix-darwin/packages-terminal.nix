{ self, ... }: {
  flake.modules.darwin.feature-packages-terminal = { pkgs, ... }: let selfpkgs = self.packages.aarch64-darwin; in {
    programs = {
      zsh.enable = true;
      bash.enable = true;
      fish.enable = true;
      fish.package = selfpkgs.fish.wrap ({ configFile.content = "${self.wrappers.fish.configFile.content}\nstarship init fish | source"; });
    };

    environment.systemPackages = with pkgs; [
      ghostty-bin
      neovim
      ripgrep
      tmux
      git
      git-lfs
      tree
      fastfetch
      
      selfpkgs.starship
    ];
  };
}
