{
  self,
  inputs,
  lib,
  ...
}: let
  configuration = {
    config,
    pkgs,
    ...
  }: {
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
        formatOnSave = true;
        enable = true;
        inlayHints.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        nix = {
          enable = true;
          lsp.servers = ["nixd"];
        };
      };

      autocomplete.blink-cmp.enable = true;

      opts.shiftwidth = 2;
      extraPackages = [pkgs.ripgrep pkgs.tree-sitter];
    };
  };
in {
  flake.wrappers.neovim = {
    pkgs,
    config,
    wlib,
    ...
  }: {
    imports = with self.wrapperModules; [wlib.modules.default config-xdg-directories config-catppuccin-flavour];
    env = {
      NIX_PATH = "nixpkgs=${inputs.nixpkgs}";
    };
    package =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          {
            options.catppuccinFlavour = lib.mkOption {
              default = config.catppuccinFlavour;
              readOnly = true;
            };
          }
          configuration
        ];
      }).neovim;
  };
}
