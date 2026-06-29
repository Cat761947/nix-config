{
  self,
  inputs,
  lib,
  ...
}: {
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
        modules = with self.modules.nvf; [
          {
            options.catppuccinFlavour = lib.mkOption {
              default = config.catppuccinFlavour;
              readOnly = true;
            };
          }
          general
          apperance
          binds
          languageOptions
        ];
      }).neovim;
  };
}
