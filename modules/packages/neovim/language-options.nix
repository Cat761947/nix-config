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
          lsp.servers = ["markdown-oxide"];
        };
      };

      # Required for render-markdown-nvim
      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        html
        latex
        yaml
      ];

      extraPackages = with pkgs; [
        tree-sitter

        # Required for render-markdown-nvim
        python314Packages.pylatexenc
      ];
    };
  };
}
