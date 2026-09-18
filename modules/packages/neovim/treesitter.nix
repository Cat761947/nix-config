{
  flake.wrappers.wrapper-neovim-treesitter = {pkgs, ...}: let
    treesitter-grammars = [
      "nix"

      # These 4 below are required for Noice.nvim
      "vim"
      "regex"
      "lua"
      "bash"

      # These 2 below are required for Noice.nvim & render-markdown.nvim
      "markdown"
      "markdown-inline"

      # These 3 below are required for render-markdown.nvim
      "html"
      "latex"
      "yaml"
    ];
  in {
    settings.treesitter_grammars = treesitter-grammars;

    specs.treesitter = {
      data = pkgs.vimPlugins.nvim-treesitter.withPlugins (
        plugins: (
          map (grammar: plugins.${grammar}) treesitter-grammars
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
  perSystem.wrappers.packages.wrapper-neovim-treesitter = true;
}
