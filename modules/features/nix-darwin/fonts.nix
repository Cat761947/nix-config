{
  flake.modules.darwin.feature-fonts = {pkgs, ...}: {
    fonts.packages = [pkgs.nerd-fonts.fira-code];
  };
}
