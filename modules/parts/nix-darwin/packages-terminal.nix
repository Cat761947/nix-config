{ self, ... }: {
  flake.modules.darwin.packages-terminal = { pkgs, ... }: {
    programs = {
      zsh.enable = true;
      bash.enable = true;
      fish.enable = true;
    };

    environment.systemPackages = with pkgs; [
      ghostty-bin
      neovim
      ripgrep
      tmux
      starship
      git
      git-lfs
      tree
      fastfetch
    ];
  };
}
