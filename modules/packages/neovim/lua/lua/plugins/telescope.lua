require("lz.n").load({
  "telescope-fzf-native.nvim",
  lazy = true,
})

require("lz.n").load({
  "telescope.nvim",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>" },
  },
  cmd = "Telescope",
  before = function()
    require("lz.n").trigger_load("telescope-fzf-native.nvim")
  end,
  after = function()
    require("telescope").setup({
      defaults = {
        default_mappings = {
          i = {
            ["<C-c>"] = "close",

            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",

            ["<C-h>"] = "preview_scrolling_up",
            ["<C-l>"] = "preview_scrolling_down",

            ["<CR>"] = "select_default",
          },
          n = {
            ["<ESC>"] = "close",
            ["<C-c>"] = "close",

            ["j"] = "move_selection_next",
            ["k"] = "move_selection_previous",

            ["h"] = "preview_scrolling_up",
            ["l"] = "preview_scrolling_down",

            ["<CR>"] = "select_default",
          },
        },
      },
    })

    require("telescope").load_extension("fzf")
  end,
})
