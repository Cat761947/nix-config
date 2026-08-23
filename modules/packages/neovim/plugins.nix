{
  flake.wrappers.wrapper-neovim-plugins = {pkgs, ...}: {
    specs = {
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
    };
  };
  perSystem.wrappers.packages.wrapper-neovim-plugins = true;
}
