{
  flake.wrappers.ghostty = { wlib, pkgs, config, ... }: {
    imports = [ wlib.modules.default ];
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    flags = {
      "--config-default-files" = "false";
      "--config-file" = config.constructFiles.config.path;
    };
    flagSeparator = "=";

    constructFiles."config" = {
      content = ''
        theme = Catppuccin Mocha
	auto-update = off
	font-family = FiraCode Nerd Font
      '';
      relPath = "config";
    };
  };
}
