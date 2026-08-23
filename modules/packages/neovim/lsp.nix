{lib, ...}: {
  flake.wrappers.wrapper-neovim-lsp = {pkgs, ...}: let
    lsp-servers = with pkgs; {
      nixd = nixd;
      lua_ls = lua-language-server;
    };
  in {
    settings.lsp_servers =
      lib.mapAttrsToList
      (name: pkg: name)
      lsp-servers;

    specs = {
      lspconfig = {
        data = pkgs.vimPlugins.nvim-lspconfig;
        config = "require('lua.lsp')";
      };

      lazydev = {
        data = pkgs.vimPlugins.lazydev-nvim;
        before = ["lspconfig"];
        after = ["lz-n" "blink"];
        lazy = true;
      };
    };

    runtimePkgs =
      map (data: {
        prefix = true;
        inherit data;
      }) (lib.mapAttrsToList
        (name: pkg: pkg)
        lsp-servers);
  };
  perSystem.wrappers.packages.wrapper-neovim-lsp = true;
}
