{ self, ... }: {
  flake.homeModules.feature-ghostty-package-config = { config, ... }: {
    home.file.".config/ghostty/config".text = self.wrappers.ghostty.constructFiles.config.content;
  };
}
