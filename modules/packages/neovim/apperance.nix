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

      lsp.inlayHints.enable = true;

      statusline.lualine = {
        enable = true;
        theme = "auto";
        globalStatus = true;

        activeSection = {
          a = [''{"mode"}''];
          b = [''{"diagnostics"}'' ''{"lsp_status"}''];
          c = [''''];
          x = [''''];
          y = [''{"branch"}''];
          z = [''{"filename"}''];
        };

        sectionSeparator = {
          right = "";
          left = "";
        };

        componentSeparator = {
          left = "";
          right = "";
        };
      };
    };
  };
}
