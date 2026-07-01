{
  flake.modules.nvf.general = {pkgs, ...}: {
    vim = {
      opts.shiftwidth = 2;

      autocomplete.blink-cmp.enable = true;
      telescope = {
        enable = true;
        extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup.fzf.fuzzy = true;
          }
        ];
      };
      visuals.nvim-web-devicons.enable = true;
      navigation.harpoon.enable = true;

      extraPackages = [pkgs.ripgrep pkgs.fd];
    };
  };
}
