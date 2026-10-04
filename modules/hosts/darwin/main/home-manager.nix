{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.host-main-home-manager = {config, ...}: {
    imports = [inputs.home-manager.darwinModules.home-manager];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users.${config.system.primaryUser} = {
        home.stateVersion = "26.11";

        imports = with self.homeModules; [
          feature-ghostty-package-config
          feature-librewolf-config
        ];
      };
    };
  };
}
