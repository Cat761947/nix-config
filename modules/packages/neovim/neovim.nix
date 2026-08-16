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

    specs.lz-n = {
      data = pkgs.vimPlugins.lz-n;
      before = ["INIT_MAIN"];
    };
  };
}
