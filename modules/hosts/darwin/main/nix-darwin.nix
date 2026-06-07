{ self, inputs, ... }: {
  flake.darwinConfigurations."main" = inputs.nix-darwin.lib.darwinSystem {
    modules = [ { 
      imports = with self.modules.darwin; [ preferences ];

      nixpkgs.hostPlatform = "aarch64-darwin";

      system.stateVersion = 7;
      system.primaryUser = "cat_761947";

      nix.settings.experimental-features = "nix-command flakes";
    } ];
  };
}
