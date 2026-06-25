{ lib, self, ... }: {
  flake.wrappers.ghostty = { wlib, pkgs, config, ... }: {
    imports = [ wlib.modules.default self.wrapperModules.catppuccin-flavour-config ];
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    flags = {
      "--config-default-files" = "false";
      "--config-file" = config.constructFiles.config.path;
    };
    flagSeparator = "=";

    constructFiles."config" = {
      content = ''
        theme = Catppuccin ${lib.toSentenceCase config.catppuccinFlavour}
	auto-update = off
	font-family = FiraCode Nerd Font
      '';
      relPath = "config";
    };
  };
}
