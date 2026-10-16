{self, ...}: {
  flake.modules.darwin.feature-linearmouse-config = {config, ...}: {
    system.defaults.CustomUserPreferences."com.lujjjh.LinearMouse".menuBarBatteryDisplayMode = "\"always\"";

    home-manager.users.${config.system.primaryUser}.imports = [self.homeModules.feature-linearmouse-config];
  };
}
