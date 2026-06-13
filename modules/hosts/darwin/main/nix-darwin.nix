{ self, inputs, ... }: {
  flake.darwinConfigurations."main" = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      { 
        imports = with self.modules.darwin; [
          host-main-home-manager

	  preferences
          packages-essential
          packages-terminal
          packages-utility
          packages-games
        ];

        nixpkgs.hostPlatform = "aarch64-darwin";

        system.stateVersion = 7;
        system.primaryUser = "cat_761947";
	users.users.cat_761947.home = "/Users/cat_761947";

        nix.settings.experimental-features = "nix-command flakes";
      } 
    ];
  };
}
