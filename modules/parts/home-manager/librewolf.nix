{ self, ... }: {
  flake.homeModules.librewolf = {
    programs.librewolf.enable = true;
    programs.librewolf.settings = {
      # General
      "browser.startup.page" = 3;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.tabs.warnOnClose" = true;
      "intl.regional_prefs.use_os_locales" = true;
      "layout.spellcheckDefault" = 0;
      "general.smoothScroll" = false;
      "accessibility.browsewithcaret" = true;

      # Browser Privacy
      "privacy.clearOnShutdown_v2.cache" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.sanitize.sanitizeOnShutdown" = false;

      "signon.management.page.breach-alerts.enabled" = false;

      #LibreWolf Preferences
      "privacy.resistFingerprinting" = false;
      "librewolf.webgl.prompt.hide" = false;
    };
  };

  flake.homeModules.librewolf-config = {
    imports = [ self.homeModules.librewolf ];
    programs.librewolf.package = null;
  };
}
