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

      lazy = {
        enable = true;
        plugins.vim-tmux-navigator = {
          package = pkgs.vimPlugins.vim-tmux-navigator;
          cmd = [
            "TmuxNavigateLeft"
            "TmuxNavigateDown"
            "TmuxNavigateUp"
            "TmuxNavigateRight"
            "TmuxNavigatePrevious"
            "TmuxNavigatorProcessList"
          ];
          keys =
            map (x: {
              key = x.key;
              action = x.action;
              mode = "n";
            }) [
              {
                key = "<c-h>";
                action = "<cmd><C-U>TmuxNavigateLeft<cr>";
              }
              {
                key = "<c-j>";
                action = "<cmd><C-U>TmuxNavigateDown<cr>";
              }
              {
                key = "<c-k>";
                action = "<cmd><C-U>TmuxNavigateUp<cr>";
              }
              {
                key = "<c-l>";
                action = "<cmd><C-U>TmuxNavigateRight<cr>";
              }
              {
                key = "<c-\\>";
                action = "<cmd><C-U>TmuxNavigatePrevious<cr>";
              }
            ];
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
