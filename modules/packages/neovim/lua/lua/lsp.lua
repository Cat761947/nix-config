vim.lsp.config("nixd", {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      options = {
        nixos = {
          expr = "(builtins.getFlake (toString ./.)).nixosConfigurations.<hostname>.options",
        },
        home_manager = {
          expr = '(builtins.getFlake (toString ./.)).homeConfigurations."<username>@<hostname>".options',
        },
      },
    },
  },
})
vim.lsp.enable("nixd")

vim.lsp.enable("lua_ls")
