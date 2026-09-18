{lib, ...}: {
  flake.wrappers.wrapper-neovim-lint = {pkgs, ...}: let
    linters = {
      markdown = {
        pkg = pkgs.markdownlint-cli2;
        name = "markdownlint-cli2";
      };
    };
  in {
    settings.linters = builtins.mapAttrs (_: data: [data.name]) linters;

    specs.lint = {
      data = pkgs.vimPlugins.nvim-lint;
      config = "require('lua.lint')";
    };

    runtimePkgs =
      map (data: {
        prefix = true;
        inherit data;
      }) (lib.mapAttrsToList
        (_: data: data.pkg)
        linters);
  };
}
