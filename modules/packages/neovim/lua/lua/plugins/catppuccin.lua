require("lz.n").load({
  "catppuccin-nvim",
  colorscheme = "catppuccin-nvim",
  after = function()
    require("catppuccin").setup({
      flavour = require("nix-info").settings.catppuccinFlavour,
      default_integrations = false,
      integrations = {
        blink_cmp = {
          style = "solid",
          enabled = true,
        },
        harpoon = true,
        noice = true,
        telescope = true,
      },
    })
  end,
})
