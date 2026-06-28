{lib, ...}: let
  flavourOption = {
    type = with lib.types; uniq str;
    default = "mocha";
    description = "The Catppuccin Flavour to use globally. See https://github.com/catppuccin/catppuccin#-palette for a list of Flavours";
    example = "frappe";
  };
in {
  options.catppuccinFlavour = lib.mkOption flavourOption;

  config = {
    flake = {
      wrappers.config-catppuccin-flavour.options.catppuccinFlavour = lib.mkOption flavourOption;

      homeModules.config-catppuccin-flavour.options.catppuccinFlavour = lib.mkOption flavourOption;

      modules.darwin.config-catppuccin-flavour.options.catppuccinFlavour = lib.mkOption flavourOption;
    };

    perSystem.wrappers.packages.config-catppuccin-flavour = true;
  };
}
