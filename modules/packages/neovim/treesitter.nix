{
  flake.wrappers.wrapper-neovim-treesitter = {pkgs, ...}: let
    # vim, regex, lua, bash, markdown, and markdown-inline are required for Noice.nvim
    treesitter-grammars = [
      "nix"
      "lua"
      "vim"
      "regex"
      "bash"
      "markdown"
      "markdown-inline"
    ];
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
  perSystem.wrappers.packages.wrapper-neovim-treesitter = true;
}
