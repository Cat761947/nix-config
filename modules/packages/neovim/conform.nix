{lib, ...}: {
  flake.wrappers.wrapper-neovim-conform = {pkgs, ...}: let
    formatters = with pkgs; {
      nix = {
        pkg = alejandra;
        name = "alejandra";
      };
      lua = {
        pkg = stylua;
        name = "stylua";
      };
    };
  in {
    settings.formatters = builtins.mapAttrs (ft: data: [data.name]) formatters;

    specs.conform = {
      data = pkgs.vimPlugins.conform-nvim;
      config = "require('lua.conform')";
    };

    runtimePkgs =
      map (data: {
        prefix = true;
        inherit data;
      }) (lib.mapAttrsToList
        (name: data: data.pkg)
        formatters);
  };
}
