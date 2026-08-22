vim.lsp.config("nixd", {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import (builtins.getFlake (toString ~/nix-config)).inputs.nixpkgs {}",
      },
      options = {
        nix_darwin = {
          expr = "(builtins.getFlake (toString ~/nix-config)).darwinConfigurations.<configName>.options",
        },
        home_manager = {
          expr = "(builtins.getFlake (toString ~/nix-config)).darwinConfigurations.<configName>.options.home-manager",
        },
      },
    },
  },
})
vim.lsp.enable("nixd")

vim.lsp.enable("lua_ls")
