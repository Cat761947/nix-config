require("lz.n").load({ "catppuccin-nvim", colorscheme = "catppuccin-nvim", after = function()
  require("catppuccin").setup({ flavour = require("nix-info").settings.catppuccinFlavour })
end})
