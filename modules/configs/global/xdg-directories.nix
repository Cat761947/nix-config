{lib, ...}: let
  xdgDefault = homeDirectory: {
    XDG_DATA_HOME = "${homeDirectory}/.local/share";
    XDG_CONFIG_HOME = "${homeDirectory}/.config";
    XDG_STATE_HOME = "${homeDirectory}/.local/state";
    XDG_DATA_DIRS = null;
    XDG_CONFIG_DIRS = null;
    XDG_CACHE_HOME = "${homeDirectory}/.cache";
    XDG_RUNTIME_DIR = null;
  };

  xdgDirectories = homeDirectory:
    with xdgDefault homeDirectory; {
      XDG_DATA_HOME = "${homeDirectory}/.cat_761947/data";
      XDG_CONFIG_HOME = "${homeDirectory}/.cat_761947/config";
      XDG_STATE_HOME = "${homeDirectory}/.cat_761947/state";
      XDG_DATA_DIRS = XDG_DATA_DIRS;
      XDG_CONFIG_DIRS = XDG_CONFIG_DIRS;
      XDG_CACHE_HOME = "${homeDirectory}/.cat_761947/cache";
      XDG_RUNTIME_DIR = "${homeDirectory}/.cat_761947/runtime";
    };

  xdgDirsConfig = homeDirectory:
    builtins.mapAttrs (name: value:
      lib.mkOption {
        type = with lib.types;
          nullOr (
            if (lib.strings.hasSuffix "_DIRS" name)
            then envVar
            else str
          );
        default = value;
      }) (xdgDirectories homeDirectory);
in {
  flake = {
    wrappers.config-xdg-directories = {
      config,
      wlib,
      ...
    }: {
      imports = [wlib.modules.default];
      options.xdgDirectories = xdgDirsConfig "$HOME";
      config.env = builtins.mapAttrs (name: value:
        lib.mkDefault {
          data = value;
          esc-fn = x: "\"${x}\"";
        })
      config.xdgDirectories;
    };

    homeModules.config-xdg-directories = {config, ...}: {
      options.xdgDirectories = xdgDirsConfig config.home.homeDirectory;
    };

    modules.darwin.config-xdg-directories = {config, ...}: {
      options.xdgDirectories = xdgDirsConfig config.users.users.${config.system.primaryUser}.home;
    };
  };

  perSystem.wrappers.packages.config-xdg-directories = true;
}
