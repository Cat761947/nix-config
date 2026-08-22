vim.lsp.config("nixd", {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import (builtins.getFlake <flakeDirectory>).inputs.nixpkgs {}",
      },
      options = {
        nix_darwin = {
          expr = "(builtins.getFlake <flakeDirectory>).darwinConfigurations.<configName>.options",
        },
        home_manager = {
          expr = "(builtins.getFlake <flakeDirectory>).darwinConfigurations.<configName>.options.home-manager",
        },
      },
    },
  },
})

vim.lsp.enable(require("nix-info").settings.lsp_servers)
