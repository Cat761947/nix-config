{
  flake.modules.darwin.config-homebrew = { pkgs, ... }: {
    homebrew.enable = true;
    homebrew.greedyCasks = true;
    homebrew.onActivation.extraFlags = [ "--force-cleanup" ];
  };
}
