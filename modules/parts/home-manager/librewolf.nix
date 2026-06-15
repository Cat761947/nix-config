{ self, inputs, ... }: {
  flake.homeModules.librewolf = { pkgs, ... }: {
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

      # LibreWolf Preferences
      "privacy.resistFingerprinting" = false;
      "librewolf.webgl.prompt.hide" = false;
    };

    programs.librewolf.profiles.default = {
      id = 0;
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          canvasblocker
	  sponsorblock
	  bitwarden
	  videospeed
	];
      };
    };
  };

  flake.homeModules.librewolf-config = {
    imports = [ self.homeModules.librewolf ];
    programs.librewolf.package = null;
  };
}
