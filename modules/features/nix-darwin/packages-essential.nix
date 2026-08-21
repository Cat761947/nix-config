{
  flake.modules.darwin.feature-packages-essential = {pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      rectangle
      librewolf
      keka
      bitwarden-desktop
    ];

    homebrew.casks = [
      "vlc"
      "linearmouse"
      "freefilesync"
      "proton-drive"
      "veracrypt-fuse-t"
      "fuse-t"
      "tuta-mail"
      {
        name = "colemak-dh";
        postinstall = "sudo cp -f \\\"/Library/Keyboard Layouts/Colemak DH.bundle/Contents/Resources/Colemak DH ANSI.keylayout\\\" \\\"/Library/Keyboard Layouts/\\\"";
      }
    ];
  };
}
