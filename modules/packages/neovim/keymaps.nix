{lib, ...}: {
  flake.modules.nvf.keymaps = {
    pkgs,
    options,
    ...
  }: let
    overrideMappings = mappingsOption: mappings: (lib.mergeAttrs (lib.mapAttrs (name: value: null) mappingsOption) mappings);
  in {
    vim = {
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
      viAlias = false;
      vimAlias = false;

      opts.mouse = "";

      navigation.harpoon.mappings = overrideMappings options.vim.navigation.harpoon.mappings {
        file1 = "<leader>h1";
        file2 = "<leader>h2";
        file3 = "<leader>h3";
        file4 = "<leader>h4";
        listMarks = "<leader>ho";
        markFile = "<leader>ha";
      };

      autocomplete.blink-cmp.mappings = overrideMappings options.vim.autocomplete.blink-cmp.mappings {
        close = "<C-x>";
        complete = "<C-c>";
        scrollDocsDown = "<C-j>";
        scrollDocsUp = "<C-k>";
        confirm = "<CR>";
        next = "<Tab>";
        previous = "<S-Tab>";
      };

      telescope = {
        mappings = overrideMappings options.vim.telescope.mappings {
          gitFiles = "<leader>fg";
          findFiles = "<leader>ff";
          liveGrep = "<leader>ft";
        };

        setupOpts.defaults.default_mappings = let
          bothBinds = {
            "<esc>" = "close";
            "<Tab>" = "move_selection_next";
            "<S-Tab>" = "move_selection_previous";
            "<CR>" = "select_default";
            "<C-h>" = "preview_scrolling_left";
            "<C-j>" = "preview_scrolling_down";
            "<C-k>" = "preview_scrolling_up";
            "<C-l>" = "preview_scrolling_right";
          };
        in {
          i = bothBinds;
          n = bothBinds;
        };
      };

      lsp.mappings = overrideMappings options.vim.lsp.mappings {
        codeAction = "<leader>la";
        goToDefinition = "<leader>ld";
      };
    };
  };
}
