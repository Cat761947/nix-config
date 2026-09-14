{
  flake.wrappers.wrapper-neovim-plugins = {pkgs, ...}: {
    specs = {
      devicons.data = pkgs.vimPlugins.nvim-web-devicons;

      catppuccin = {
        data = pkgs.vimPlugins.catppuccin-nvim;
        lazy = true;
        config = "require('lua.plugins.catppuccin')";
        before = ["init"];
        after = ["lz-n"];
      };

      blink = {
        data = pkgs.vimPlugins.blink-cmp;
        config = "require('lua.plugins.blink')";
      };

      telescope = {
        data = with pkgs.vimPlugins; [
          telescope-nvim
          telescope-fzf-native-nvim
        ];
        config = "require('lua.plugins.telescope')";
        lazy = true;
        after = ["lz-n" "devicons"];
      };

      noice = {
        data = with pkgs.vimPlugins; [noice-nvim nvim-notify];
        after = ["treesitter"];
        config = "require('lua.plugins.noice')";
      };

      lualine = {
        data = pkgs.vimPlugins.lualine-nvim;
        after = ["devicons" "noice"];
        config = "require('lua.plugins.lualine')";
      };

      vim-tmux-navigator = {
        data = pkgs.vimPlugins.vim-tmux-navigator;
        config = "require('lua.plugins.vim-tmux-navigator')";
        after = ["lz-n"];
        lazy = true;
      };

      harpoon = {
        data = pkgs.vimPlugins.harpoon2;
        config = "require('lua.plugins.harpoon')";
        after = ["lz-n"];
        lazy = true;
      };
    };
    runtimePkgs = [
      # Required for Telescope
      {
        data = pkgs.fd;
        prefix = true;
      }
    ];
  };
  perSystem.wrappers.packages.wrapper-neovim-plugins = true;
}
