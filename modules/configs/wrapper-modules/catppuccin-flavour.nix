{ lib, options, ... }: let
  flavourOption = {
    type = with lib.types; uniq str;
    default = "mocha";
    description = "The Catppuccin Flavour to use globally. See https://github.com/catppuccin/catppuccin#-palette for a list of Flavours";
    example = "frappe";
  };
in{
  options.catppuccinFlavour = lib.mkOption flavourOption;

  config.flake.wrappers.catppuccin-flavour-config.options.catppuccinFlavour = lib.mkOption flavourOption;

  config.perSystem = {
    wrappers.packages.catppuccin-flavour-config = true;
  };
}
