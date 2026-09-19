vim.cmd.colorscheme("catppuccin-nvim")

vim.o.number = true
vim.o.relativenumber = true

vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.mouse = ""

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
