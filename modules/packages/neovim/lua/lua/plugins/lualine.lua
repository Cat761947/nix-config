local config = {
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },

  sections = {
    lualine_a = {
      "mode",
      {
        ---@diagnostic disable-next-line: undefined-field
        require("noice").api.status.mode.get,
        ---@diagnostic disable-next-line: undefined-field
        cond = require("noice").api.status.mode.has,
      },
    },
    lualine_b = { "diagnostics" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "lsp_status" },
    lualine_z = {
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 }, colored = false },
      { "filename", padding = { left = 0, right = 1 } },
    },
  },
}
config.inactive_sections = config.sections

vim.o.showmode = false

require("lualine").setup(config)
