{
  flake.modules.darwin.config-homebrew = {pkgs, ...}: {
    homebrew = {
      enable = true;
      greedyCasks = true;
      onActivation.extraFlags = ["--force-cleanup"];
    };
  };
}
