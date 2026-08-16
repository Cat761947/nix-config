{
  flake.wrappers.wrapper-neovim-plugins = {pkgs, ...}: {
    specs = {
      catppuccin = {
        data = pkgs.vimPlugins.catppuccin-nvim;
        lazy = true;
        config = "require('plugins.catppuccin')";
        before = ["INIT_MAIN"];
      };
    };
  };
  perSystem.wrappers.packages.wrapper-neovim-plugins = true;
}
