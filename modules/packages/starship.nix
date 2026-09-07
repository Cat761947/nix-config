{self, ...}: {
  flake.wrappers.starship = {
    config,
    wlib,
    ...
  }: {
    imports = with self.wrapperModules; [
      wlib.wrapperModules.starship
      config-catppuccin-flavour
      config-xdg-directories
    ];
    preset = ["catppuccin-powerline"];
    settings = {
      palette = "catppuccin_${config.catppuccinFlavour}";
      cmd_duration.show_notifications = false;
    };
    env.STARSHIP_CACHE = {
      data = "${config.xdgDirectories.XDG_CACHE_HOME}/starship";
      esc-fn = x: "\"${x}\"";
    };
  };
}
