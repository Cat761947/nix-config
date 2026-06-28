{inputs, ...}: {
  flake.packages.aarch64-darwin = with inputs.nix-darwin.packages.aarch64-darwin; {
    inherit darwin-rebuild;
    inherit darwin-uninstaller;
  };
  perSystem = {inputs', ...}: {
    packages.home-manager = inputs'.home-manager.packages.home-manager;
  };
}
