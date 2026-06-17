{ self, inputs, ... }: {
  flake.homeModules.feature-librewolf = {
    programs.librewolf.enable = true;
    programs.librewolf.settings = {
      # General
      "browser.startup.page" = 3;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.tabs.warnOnClose" = true;
      "intl.regional_prefs.use_os_locales" = true;
      "layout.spellcheckDefault" = 0;
      "general.smoothScroll" = false;

      # Browser Privacy
      "privacy.clearOnShutdown_v2.cache" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.sanitize.sanitizeOnShutdown" = false;

      "signon.management.page.breach-alerts.enabled" = false;

      # LibreWolf Preferences
      "privacy.resistFingerprinting" = false;
      "librewolf.webgl.prompt.hide" = false;
    };
  };

  flake.homeModules.feature-librewolf-noinstall = {
    imports = [ self.homeModules.feature-librewolf ];
    programs.librewolf.package = null;
  };
}
