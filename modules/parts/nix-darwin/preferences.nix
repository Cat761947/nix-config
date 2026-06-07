{
  flake.modules.darwin.preferences = {
    # Firewall
    networking.applicationFirewall = {
      enable = true;
      allowSignedApp = false;
      allowSigned = false;
    };

    # Appearance
    system.defaults.NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleIconAppearanceTheme = "RegularDark";
      AppleShowScrollBars = "Always";
      AppleScrollerPagingBehavior = true;
    };

    # Menu Bar
    system.defaults = {
      controlcenter.NowPlaying = false;
    };

    # Desktop & Dock
    system.defaults = {
      dock = {
        persistent-apps = [ { app = "/Applications/Tuta Mail.app/"; } ];
        persistent-others = [ ];
        tilesize = 48;
        mineffect = "scale";
        autohide = true;
        show-recents = false;
	expose-group-apps = true;
	wvous-br-corner = 1;
        wvous-tl-corner = 5;
      };

      WindowManager = {
        HideDesktop = false;
	EnableStandardClickToShowDesktop = false;
	AutoHide = true;
	StandardHideWidgets = true;
	StageManagerHideWidgets = true;
	EnableTilingByEdgeDrag = false;
	EnableTopTilingByEdgeDrag = false;
	EnableTilingOptionAccelerator = false;
      };
    };

    # Sound
    system.defaults = {
      ".GlobalPreferences"."com.apple.sound.beep.sound" = "/System/Library/Sounds/Funk.aiff";
      NSGlobalDomain."com.apple.sound.beep.feedback" = 1;
    };

    # Lock Screen
    system.defaults.screensaver.askForPasswordDelay = 0;

    # Keyboard
    system.defaults = {
      NSGlobalDomain = {
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
	"com.apple.keyboard.fnState" = true;
	NSAutomaticSpellingCorrectionEnabled = false;
	NSAutomaticCapitalizationEnabled = false;
	NSAutomaticInlinePredictionEnabled = false;
	NSAutomaticPeriodSubstitutionEnabled = false;
	NSAutomaticQuoteSubstitutionEnabled = false;
      };
      hitoolbox.AppleFnUsageType = "Do Nothing";
    };

    # Finder
    system.defaults = {
      NSGlobalDomain = {
        AppleShowAllFiles = true;
	AppleShowAllExtensions = false;
      };

      finder = {
        ShowMountedServersOnDesktop = true;
	ShowHardDrivesOnDesktop = true;
	NewWindowTarget = "Home";
	FXEnableExtensionChangeWarning = false;
	FXDefaultSearchScope = "SCcf";
	ShowStatusBar = true;
	ShowPathbar = true;
      };
    };
  };
}
