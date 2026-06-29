{
  flake.modules.nvf.keymaps = {pkgs, ...}: {
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

      navigation.harpoon.mappings = {
        file1 = "<leader>h1";
        file2 = "<leader>h2";
        file3 = "<leader>h3";
        file4 = "<leader>h4";
        listMarks = "<leader>ho";
        markFile = "<leader>ha";
      };

      autocomplete.blink-cmp.mappings = {
        close = "<C-x>";
        complete = "<C-c>";
        scrollDocsDown = "<C-b>";
        scrollDocsUp = "<C-n>";
      };

      telescope.setupOpts.defaults.default_mappings = let
        bothBinds = {
          "<esc>" = "close";
          "<Down>" = "move_selection_next";
          "<Up>" = "move_selection_previous";
          "<CR>" = "select_default";
          "<C-v>" = "preview_scrolling_left";
          "<C-b>" = "preview_scrolling_down";
          "<C-n>" = "preview_scrolling_up";
          "<C-m>" = "preview_scrolling_right";
          "<C-j>" = "nop";
        };
      in {
        i = bothBinds;
        n = bothBinds;
      };
    };
  };
}
