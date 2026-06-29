{
  flake.modules.nvf.general = {pkgs, ...}: {
    vim = {
      opts.shiftwidth = 2;

      autocomplete.blink-cmp.enable = true;
      telescope.enable = true;
      navigation.harpoon.enable = true;

      extraPackages = [pkgs.ripgrep];
    };
  };
}
