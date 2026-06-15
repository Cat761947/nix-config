{ self, inputs, ... }: {
  flake.darwinConfigurations."main" =
  let
    configuration = { pkgs, ... }: {
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.overlays = [ inputs.nur.overlays.default ];

      system.stateVersion = 7;
      system.primaryUser = "cat_761947";
      users.users.cat_761947.home = "/Users/cat_761947";
      users.users.cat_761947.shell = pkgs.fish;
      users.users.cat_761947.uid = 501;
      users.knownUsers = [ "cat_761947" ];
      nix.settings.experimental-features = "nix-command flakes";
    };
  in inputs.nix-darwin.lib.darwinSystem {
    modules = with self.modules.darwin; [
      configuration
      
      host-main-home-manager

      preferences

      homebrew-config
      packages-essential
      packages-terminal
      packages-utility
      packages-games
    ];
  };
}
