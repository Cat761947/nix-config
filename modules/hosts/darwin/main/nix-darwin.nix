{
  self,
  inputs,
  lib,
  ...
}: {
  flake.darwinConfigurations."main" = let
    configuration = {
      pkgs,
      config,
      ...
    }: {
      # Remove next 2 lines when updating flake.lock
      documentation.enable = false;
      system.tools.darwin-uninstaller.enable = false;

      nixpkgs.hostPlatform = "aarch64-darwin";

      system = {
        stateVersion = 7;
        primaryUser = "cat_761947";
      };
      users = {
        users.${config.system.primaryUser} = {
          home = "/Users/${config.system.primaryUser}";
          shell = lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.shell-fish-main;
          uid = 501;
        };
        knownUsers = [config.system.primaryUser];
      };
      nix.settings = {
        experimental-features = "nix-command flakes";
        auto-optimise-store = true;
      };
    };
  in
    inputs.nix-darwin.lib.darwinSystem {
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
