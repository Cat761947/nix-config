{
  flake.wrappers.wrapper-neovim-treesitter = {
    pkgs,
    config,
    ...
  }: {
    settings.treesitter_grammars = ["nix" "lua"];

    specs.treesitter = {
      data = pkgs.vimPlugins.nvim-treesitter.withPlugins (
        plugins: (
          map (ext: plugins.${ext}) config.settings.treesitter_grammars
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
