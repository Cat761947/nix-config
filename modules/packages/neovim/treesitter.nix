{
  flake.wrappers.wrapper-neovim-treesitter = {pkgs, ...}: let
    treesitter-grammars = ["nix" "lua"];
  in {
    settings.treesitter_grammars = treesitter-grammars;

    specs.treesitter = {
      data = pkgs.vimPlugins.nvim-treesitter.withPlugins (
        plugins: (
          map (ext: plugins.${ext}) treesitter-grammars
        )
      );
      config = "require('lua.treesitter')";
    };

    runtimePkgs = [
      {
        data = pkgs.tree-sitter;
        prefix = true;
      }
    ];
  };
}
