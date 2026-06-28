{
  flake.modules.darwin.config-homebrew = {
    homebrew = {
      enable = true;
      greedyCasks = true;
      onActivation.extraFlags = ["--force-cleanup"];
    };
  };
}
