vim.api.nvim_create_autocmd("FileType", {
  pattern = require("nix-info").settings.treesitter_grammars,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
