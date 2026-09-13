{
  self,
  lib,
  ...
}: {
  flake.wrappers.yazi = {
    wlib,
    pkgs,
    config,
    ...
  }: let
    catppuccinYazi = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "yazi";
      rev = "d62802be39210ea10e54b3e3b09735c6cb9e57c1";
      hash = "sha256-bwzEO8exoBwa19q+jnYjHkaamGl2mhfukIEhDfUCRGI=";
    };

    catppuccinBat = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "bat";
      rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
      hash = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
    };
  in {
    imports = with self.wrapperModules; [
      wlib.wrapperModules.yazi
      config-catppuccin-flavour
      config-xdg-directories
    ];
    settings.theme =
      lib.mergeAttrs (lib.importTOML "${catppuccinYazi}/themes/${config.catppuccinFlavour}/catppuccin-${config.catppuccinFlavour}-blue.toml")
      {mgr.syntect_theme = "${catppuccinBat}/themes/Catppuccin ${lib.toSentenceCase config.catppuccinFlavour}.tmTheme";};
  };
}
