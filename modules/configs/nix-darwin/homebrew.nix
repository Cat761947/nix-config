{
  flake.modules.darwin.config-homebrew = {
    homebrew = {
      enable = true;
      greedyCasks = true;
      onActivation = {
        cleanup = "uninstall";
        autoUpdate = true;
        upgrade = true;
      };
    };
  };
}
