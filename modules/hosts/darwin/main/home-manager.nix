{ self, inputs, ... }: {
  flake.modules.darwin.host-main-home-manager = { 
    imports = [ inputs.home-manager.darwinModules.home-manager ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    
    home-manager.users.cat_761947 = {
      
      home.stateVersion = "26.11";

      imports = [
        self.homeModules.git-config
      ];
    };
  };
}
