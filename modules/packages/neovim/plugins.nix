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
        data = [
          pkgs.vimPlugins.telescope-nvim
          pkgs.vimPlugins.telescope-fzf-native-nvim
        ];
        config = "require('lua.plugins.telescope')";
        lazy = true;
        after = ["lz-n" "devicons"];
      };
    };
    runtimePkgs = [
      {
        data = pkgs.fd;
        prefix = true;
      }
    ];
  };
  perSystem.wrappers.packages.wrapper-neovim-plugins = true;
}
