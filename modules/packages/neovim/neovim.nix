{self, ...}: {
  flake.wrappers.neovim = {
    pkgs,
    wlib,
    config,
    ...
  }: {
    imports = with self.wrapperModules; [
      wlib.wrapperModules.neovim
      config-xdg-directories
      config-catppuccin-flavour
      wrapper-neovim-plugins
      wrapper-neovim-lsp
      wrapper-neovim-conform
      wrapper-neovim-treesitter
    ];

    runtimePkgs = [
      {
        prefix = true;
        data = pkgs.ripgrep;
      }
    ];

    settings = {
      inherit (config) catppuccinFlavour;
      config_directory = ./.;
    };

    specs = {
      init = {
        before = ["INIT_MAIN"];
        config = "require('lua.init')";
        data = null;
      };

      lz-n.data = pkgs.vimPlugins.lz-n;
    };
  };
}
