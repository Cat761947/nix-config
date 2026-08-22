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

vim.lsp.config("lua_ls", { settings = { Lua = { codeLense = { enable = true } } } })
require("lz.n").load({
  "lazydev.nvim",
  ft = "lua",
  after = function()
    require("lazydev").setup({
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end,
})

vim.lsp.enable(require("nix-info").settings.lsp_servers)

vim.lsp.codelens.enable()
vim.lsp.linked_editing_range.enable()
vim.lsp.inlay_hint.enable()

vim.diagnostic.config({ virtual_text = true })
