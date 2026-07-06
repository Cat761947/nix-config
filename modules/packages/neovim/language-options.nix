{
  flake.modules.nvf.languageOptions = {pkgs, ...}: {
    vim = {
      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableTreesitter = true;
        nix = {
          enable = true;
          lsp.servers = ["nixd"];
        };

        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
          format.type = ["prettier"];
        };
      };

      extraPackages = [pkgs.tree-sitter];
    };
  };
}
