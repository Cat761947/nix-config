{ inputs, ... }: {
  flake.packages.aarch64-darwin.darwin-rebuild = inputs.nix-darwin.packages.aarch64-darwin.darwin-rebuild;
  flake.packages.aarch64-darwin.darwin-uninstaller = inputs.nix-darwin.packages.aarch64-darwin.darwin-uninstaller;

  perSystem = { inputs', ... }: {
    packages.home-manager = inputs'.home-manager.packages.home-manager;
  };
}
