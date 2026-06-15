{ self, ... }: {
  flake.modules.darwin.feature-packages-essential = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      rectangle
      librewolf
      keka
    ];

    homebrew.casks = [
      "vlc"
      "linearmouse"
      "freefilesync"
      "proton-drive"
      "macfuse"
      "veracrypt"
      "tuta-mail"
    ];
  };
}
