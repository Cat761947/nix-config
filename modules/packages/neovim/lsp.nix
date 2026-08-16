{
  flake.wrappers.wrapper-neovim-lsp = {pkgs, ...}: {
    specs.nvim-lspconfig = {
      data = pkgs.vimPlugins.nvim-lspconfig;
      config = "require('lua.lsp')";
    };
    runtimePkgs = with pkgs; (map (data: {
        prefix = true;
        inherit data;
      }) [
        nixd
        lua-language-server
      ]);
  };
  perSystem.wrappers.packages.wrapper-neovim-lsp = true;
}
