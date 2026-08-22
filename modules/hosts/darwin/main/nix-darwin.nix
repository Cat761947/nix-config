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
      nixpkgs.hostPlatform = "aarch64-darwin";

      system = {
        stateVersion = 7;
        primaryUser = "cat_761947";
      };

      users.users.${config.system.primaryUser}.shell = lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.shell-fish-main;

      nix.nixPath = [
        {configName = "main";}
        {flakeDirectory = toString ~/nix-config;}
      ];
    };
  in
    inputs.nix-darwin.lib.darwinSystem {
      modules = with self.modules.darwin; [
        configuration

        host-main-home-manager

        feature-preferences
        feature-terminal-main

        config-homebrew
        config-primary-user-setup
        config-nix-settings

        feature-packages-essential
        feature-packages-utility
        feature-packages-games

        feature-fonts
      ];
    };
}
