{
  flake.modules.darwin.homebrew-config = { pkgs, ... }: {
    homebrew.enable = true;
    homebrew.greedyCasks = true;
    homebrew.onActivation.extraFlags = [ "--force-cleanup" ];
  };
}
