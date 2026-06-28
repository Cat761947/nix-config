{inputs, ...}: {
  imports = with inputs; [
    flake-parts.flakeModules.modules
    home-manager.flakeModules.home-manager
    wrapper-modules.flakeModules.wrappers
  ];
}
