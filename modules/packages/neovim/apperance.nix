{
  flake.modules.nvf.apperance = {config, ...}: {
    vim = {
      theme = {
        enable = true;
        style = config.catppuccinFlavour;
        name = "catppuccin";
      };

      diagnostics = {
        enable = true;
        config.virtual_text = true;
      };

      lsp = {
        enable = true;
        inlayHints.enable = true;
      };
    };
  };
}
