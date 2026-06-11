{ self, ... }: let
  homebrew-config = self.modules.darwin.homebrew-config;
in {
  flake.modules.darwin = {
    packages-essential = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        rectangle
	librewolf
	keka
      ];

      imports = [ homebrew-config ];
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

    packages-terminal = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        ghostty-bin
	neovim
	ripgrep
	tmux
	starship
	git
	git-lfs
	tree
	fastfetch
      ];
    };

    packages-utility = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        obsidian
	libreoffice-bin
	discord
	audacity
      ];

      imports = [ homebrew-config ];
      homebrew.casks = [
        "protonvpn"
	"obs"
      ];
    };

    packages-games = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        prismlauncher
      ];

      imports = [ homebrew-config ];
      homebrew.casks = [
        "steam"
      ];
    };
  };
}
