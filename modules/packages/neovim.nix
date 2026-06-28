{
  self,
  inputs,
  lib,
  ...
}: let
  configuration = {config, pkgs, ...}: {
    vim = {
      theme = {
        enable = true;
        style = config.catppuccinFlavour;
        name = "catppuccin";
      };

      opts = {
        shiftwidth = 2;
      };

      lsp = {
        formatOnSave = true;
        enable = true;
      };
      
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        nix.enable = true;
      };

      extraPackages = [ pkgs.ripgrep pkgs.tree-sitter ];
    };
  };
in {
  flake.wrappers.neovim = {
    pkgs,
    config,
    ...
  }: {
    imports = with self.wrapperModules; [config-xdg-directories config-catppuccin-flavour];
    package =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          {
            options.catppuccinFlavour = lib.mkOption {
              default = config.catppuccinFlavour;
              readOnly = true;
            };
          }
          configuration
        ];
      }).neovim;
  };
}
