{inputs, ...}: {
  imports = with inputs; [
    flake-parts.flakeModules.modules
    home-manager.flakeModules.home-manager
    nix-wrapper-modules.flakeModules.wrappers
  ];
}
