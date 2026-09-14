require("blink.cmp").setup({
  signature = { enabled = true },

  fuzzy = { implementation = "rust" },

  completion = { ghost_text = { enabled = true } },

  keymap = {
    preset = "none",

    ["<C-j>"] = { "select_next" },
    ["<C-k>"] = { "select_prev" },

    ["<C-l>"] = { "scroll_documentation_down", "scroll_signature_down" },
    ["<C-h>"] = { "scroll_documentation_up", "scroll_signature_up" },

    ["<C-c>"] = { "show", "select_and_accept" },

    ["<C-q>"] = { "cancel" },

    ["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-s>"] = { "show", "show_signature", "hide_signature" },
  },

  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } },
  },
})
