{self, ...}: {
  flake.homeModules.feature-ghostty-package-config = {config, ...}: let
    envVar = varName:
      with config;
        if xdgDirectories.${varName} != null
        then "env = ${varName}=${xdgDirectories.${varName}}"
        else "";
  in {
    imports = [self.homeModules.config-xdg-directories];
    home.file.".config/ghostty/config".text = ''
      ${self.wrappers.ghostty.constructFiles.config.content}
      ${envVar "XDG_DATA_HOME"}
      ${envVar "XDG_CONFIG_HOME"}
      ${envVar "XDG_STATE_HOME"}
      ${envVar "XDG_DATA_DIRS"}
      ${envVar "XDG_CONFIG_DIRS"}
      ${envVar "XDG_CACHE_HOME"}
      ${envVar "XDG_RUNTIME_DIR"}
    '';
  };
}
