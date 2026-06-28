{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.host-main-home-manager = {
    imports = [inputs.home-manager.darwinModules.home-manager];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users.cat_761947 = {
        home.stateVersion = "26.11";

        imports = with self.homeModules; [
          feature-ghostty-package-config
          feature-linearmouse-config
          feature-librewolf-config
        ];
      };
    };
  };
}
