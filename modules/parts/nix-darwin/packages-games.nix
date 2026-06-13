{ self, ... }: {
  flake.modules.darwin.packages-games = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];

    homebrew.casks = [
      "steam"
    ];
  };
}
