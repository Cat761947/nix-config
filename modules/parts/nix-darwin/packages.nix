{
  flake.modules.darwin = {
    packages-essential = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = [
        pkgs.rectangle
	pkgs.librewolf
	pkgs.keka
      ];

      homebrew.enable = true;
      homebrew.casks = [
        "vlc"
	"linearmouse"
	"freefilesync"
	"proton-drive"
	"veracrypt"
	"tuta-mail"
      ];
    };

    packages-terminal = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.ghostty-bin
	pkgs.neovim
	pkgs.ripgrep
	pkgs.tmux
	pkgs.starship
	pkgs.git
	pkgs.git-lfs
	pkgs.tree
	pkgs.fastfetch
      ];
    };

    packages-utility = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = [
        pkgs.obsidian
	pkgs.libreoffice-bin
	pkgs.discord
	pkgs.audacity
      ];

      homebrew.enable = true;
      homebrew.casks = [
        "protonvpn"
	"obs"
      ];
    };

    packages-games = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.prismlauncher
      ];

      homebrew.enable = true;
      homebrew.casks = [
        "steam"
      ];
    };
  };
}
