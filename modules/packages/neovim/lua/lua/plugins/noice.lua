---@diagnostic disable-next-line: duplicate-set-field
require("noice.config.routes").defaults = function()
  local options = require("noice.config").options

  -- Cmdline setup is automatically prepended by noice.config.cmdline during setup
  -- Presets and routes specified in setup are also prepended
  --- @type NoiceRouteConfig[]
  return {
    -- Search Count
    {
      view = options.messages.view_search,
      opts = { title = "Search Count", replace = true },
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
    },

    -- Mode
    {
      view = "mini",
      opts = { title = "Mode" },
      filter = { event = "msg_showmode" },
    },

    -- :messages command
    {
      view = options.messages.view_history,
      opts = { title = "Messages" },
      filter = { event = "msg_history_show" },
    },

    -- :history command
    {
      view = options.messages.view_history,
      opts = { title = "History" },
      filter = { event = "msg_show", kind = "list_cmd" },
    },

    -- :! commands
    {
      view = options.messages.view_history,
      opts = { title = "Shell Output", merge = true },
      filter = {
        event = "msg_show",
        ---@diagnostic disable-next-line: assign-type-mismatch
        kind = { "shell_out", "shell_cmd" },
      },
    },

    -- Progress Messages
    {
      view = options.messages.view,
      opts = { title = "Progress", replace = true },
      filter = { event = "msg_show", kind = "progress" },
    },

    -- LSP Progress
    {
      view = options.lsp.progress.view,
      filter = { event = "lsp", kind = "progress" },
      opts = { title = "LSP Progress", replace = true },
    },

    -- vim.notify
    {
      view = options.notify.view,
      filter = { event = "notify" },
      opts = { title = "Notify" },
    },

    -- Lua Print
    {
      view = options.messages.view,
      filter = {
        event = "msg_show",
        ---@diagnostic disable-next-line: assign-type-mismatch
        kind = "lua_print",
      },
      opts = { title = "Print" },
    },

    -- Echo
    {
      view = options.messages.view,
      filter = { event = "msg_show", kind = { "echo", "echomsg" } },
      opts = { title = "Echo" },
    },
    {
      view = options.messages.view,
      filter = { event = "msg_show", kind = "echoerr" },
      opts = { title = "Echo Error" },
    },

    -- Error Messages
    {
      view = options.messages.view_error,
      filter = { error = true },
      opts = { title = "Error" },
    },

    -- Warning Messages
    {
      view = options.messages.view_warn,
      filter = { warning = true },
      opts = { title = "Warning" },
    },

    -- Regular Messages
    {
      view = options.messages.view,
      filter = { event = "msg_show" },
      opts = { title = "Notice" },
    },

    -- Ignored Events
    {
      opts = { skip = true },
      filter = {
        any = {
          { event = "msg_showcmd" },
          { event = "msg_ruler" },
          { event = "lsp", kind = "signature" },
        },
      },
    },

    -- Unhandled Events
    {
      view = "popup",
      opts = { title = "Unhandled" },
      filter = {},
    },
  }
end

---@type NoiceConfig
require("noice").setup({
  messages = { view_history = "popup" },

  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },

  presets = {
    bottom_search = true,
  },
})
