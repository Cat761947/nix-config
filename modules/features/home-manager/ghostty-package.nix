{ self, ... }: {
  flake.homeModules.feature-ghostty-package = { config, ... }: {
    home.file."${config.xdg.configHome}/ghostty/config".text = self.wrappers.ghostty.constructFiles.config.content;
  };
}
