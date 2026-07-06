{inputs, ...}: {
  flake.modules.darwin.feature-packages-utility = {pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      obsidian
      libreoffice-bin
      discord
      # Switch to pkgs on next flake.lock update
      inputs.nixpkgs-stable-darwin.legacyPackages.${pkgs.stdenv.hostPlatform.system}.audacity
    ];

    homebrew.casks = [
      "protonvpn"
      "obs"
    ];
  };
}
