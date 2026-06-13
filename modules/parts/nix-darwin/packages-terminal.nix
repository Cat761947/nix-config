{ self, ... }: {
  flake.modules.darwin.packages-terminal = { pkgs, ... }: {
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
