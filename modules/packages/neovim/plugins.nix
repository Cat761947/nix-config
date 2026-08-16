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
    };
  };
  perSystem.wrappers.packages.wrapper-neovim-plugins = true;
}
