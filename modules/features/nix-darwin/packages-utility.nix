{
  flake.modules.darwin.feature-packages-utility = {pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      libreoffice-bin
      discord
      audacity
    ];

    homebrew.casks = [
      "protonvpn"
      "obs"
    ];
  };
}
