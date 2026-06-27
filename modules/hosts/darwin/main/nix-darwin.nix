{ self, inputs, ... }: {
  flake.darwinConfigurations."main" =
  let
    configuration = { pkgs, config, ... }: {
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.stateVersion = 7;
      system.primaryUser = "cat_761947";
      users.users.${config.system.primaryUser} = {
        home = "/Users/${config.system.primaryUser}";
        shell = "/run/current-system/sw/bin/fish";
        uid = 501;
      };
      users.knownUsers = [ config.system.primaryUser ];
      nix.settings.experimental-features = "nix-command flakes";
    };
  in inputs.nix-darwin.lib.darwinSystem {
    modules = with self.modules.darwin; [
      configuration
      
      host-main-home-manager

      feature-preferences
      feature-terminal-main

      config-homebrew
      feature-packages-essential
      feature-packages-utility
      feature-packages-games
      
      feature-fonts
    ];
  };
}
