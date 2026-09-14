local harpoon
local function select(n)
  return function()
    harpoon:list():select(n)
  end
end

require("lz.n").load({
  "harpoon2",
  keys = {
    {
      "<leader>ho",
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    {
      "<C-c>",
      mode = { "n", "i" },
      function()
        harpoon.ui:close_menu()
      end,
    },
    {
      "<leader>ha",
      function()
        harpoon:list():add()
      end,
    },
    { "<leader>h1", select(1) },
    { "<leader>h2", select(2) },
    { "<leader>h3", select(3) },
    { "<leader>h4", select(4) },
    { "<leader>h5", select(5) },
  },
  after = function()
    harpoon = require("harpoon")
    ---@diagnostic disable-next-line:missing-parameter
    harpoon.setup()
  end,
})
