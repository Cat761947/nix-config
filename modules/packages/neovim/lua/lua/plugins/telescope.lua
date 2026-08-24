require("lz.n").load({
  "telescope-fzf-native.nvim",
  lazy = true,
})

local keymap = require("lz.n").keymap({
  "telescope.nvim",
  keys = { "<leader>ff" },
  cmd = "Telescope",
  before = function()
    require("lz.n").trigger_load("telescope-fzf-native.nvim")
  end,
  after = function()
    require("telescope").setup({
      defaults = {
        default_mappings = {
          i = {
            ["<C-q>"] = "close",

            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",

            ["<C-h>"] = "preview_scrolling_up",
            ["<C-l>"] = "preview_scrolling_down",

            ["<CR>"] = "select_default",
          },

          n = {
            ["<C-q>"] = "close",
            ["q"] = "close",

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

keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, {})
keymap.set("n", "<leader>ft", function()
  require("telescope.builtin").live_grep()
end, {})
keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").git_files()
end, {})
