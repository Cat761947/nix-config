{
  flake.modules.darwin.config-nix-settings.nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };
}
