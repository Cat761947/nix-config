{
  flake.modules.darwin.feature-packages-essential = {pkgs, ...}: {
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
      {
        name = "colemak-dh";
        postinstall = "sudo cp -f \\\"/Library/Keyboard Layouts/Colemak DH.bundle/Contents/Resources/Colemak DH ANSI.keylayout\\\" \\\"/Library/Keyboard Layouts/\\\"";
      }
    ];
  };
}
