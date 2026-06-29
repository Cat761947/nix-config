{
  flake.modules.nvf.languageOptions = {pkgs, ...}: {
    vim = {
      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        nix = {
          enable = true;
          lsp.servers = ["nixd"];
        };
      };

      extraPackages = [pkgs.tree-sitter];
    };
  };
}
