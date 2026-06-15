{ self, ... }: {
  flake.modules.darwin.feature-packages-games = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];

    homebrew.casks = [
      "steam"
    ];
  };
}
