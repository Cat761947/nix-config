require("conform").setup({
  formatters_by_ft = require("nix-info").settings.formatters,
  format_on_save = {
    timeout_ms = 500,
  },
})
