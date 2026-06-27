{
  flake.modules.darwin.feature-preferences = { config, ... }: {
    
    # Firewall
    networking.applicationFirewall = {
      enable = true;
      allowSignedApp = false;
      allowSigned = false;
    };
    
    # Language & Region
    system.defaults.CustomUserPreferences.NSGlobalDomain = {
      AppleICUDateFormatStrings = { "1" = "dd/MM/y"; };
      AppleICUNumberSymbols = { "0" = "."; "1" = " "; "10" = "."; "17" = " "; };
      AppleLiveTextEnabled = false;
    };
    
    # Accessibility
    system.defaults.CustomUserPreferences = {
      "com.apple.universalaccess" = {
        differentiateWithoutColor = true;
	showToolbarButtonShapes = true;
	showWindowTitlebarIcons = true;
      };
    
      "com.apple.Accessibility".DifferentiateWithoutColor = 1;
    };

    # Appearance
    system.defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleIconAppearanceTheme = "RegularDark";
        AppleShowScrollBars = "Always";
        AppleScrollerPagingBehavior = true;
      };
    
      CustomUserPreferences = {
        NSGlobalDomain.NSGlassDiffusionSetting = true;
      };
    };

    # Menu Bar
    system.defaults = {
      controlcenter.NowPlaying = false;
      
      CustomUserPreferences = {
        NSGlobalDomain = {
	  AppleMenuBarVisibleInFullscreen = true;
	  SLSMenuBarUseBlurredAppearance = true;
	};

        "com.apple.controlcenter".AutoHideMenuBarOption = 3;
      };
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

      CustomUserPreferences = {
        NSGlobalDomain = {
	  AppleActionOnDoubleClick = "None";
	  AppleWindowTabbingMode = "always";
	  NSCloseAlwaysConfirmsChanges = true;
	};
	
	"com.apple.dock" = {
	  enterMissionControlByTopWindowDrag = false;
	  wvous-tl-modifier = 131072;
        };
      };
    };
    
    # Spotlight
    system.defaults.CustomUserPreferences = {
      "com.apple.assistant.support"."Search Queries Data Sharing Status" = 2;
      
      "com.apple.Spotlight".EnabledPreferenceRules = [
        "Custom.relatedContents"
	"com.apple.AppStore"
	"com.apple.iBooksX"
	"com.apple.iCal"
	"com.apple.clock"
	"com.apple.AddressBook"
	"com.apple.Dictionary"
	"com.apple.mail"
	"com.apple.Notes"
	"com.apple.Photos"
	"com.apple.podcasts"
        "ch.protonmail.drive"
        "com.apple.reminders"
	"com.apple.Safari"
	"com.apple.shortcuts"
	"com.apple.systempreferences"
	"com.apple.tips"
	"com.apple.VoiceMemos"
	"System.files"
	"System.folders"
	"System.iphoneApps"
	"System.menuItems"
      ];
    };

    # Sound
    system.defaults = {
      ".GlobalPreferences"."com.apple.sound.beep.sound" = "/System/Library/Sounds/Funk.aiff";
      NSGlobalDomain."com.apple.sound.beep.feedback" = 1;
    };

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
      CustomUserPreferences.NSGlobalDomain.AppleKeyboardUIMode = 2;
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

      CustomUserPreferences."com.apple.finder"."NSWindowTabbingShoudShowTabBarKey-com.apple.finder.TBrowserWindow" = true;
    };

    # TextEdit
    system.defaults.CustomUserPreferences."${config.users.users.${config.system.primaryUser}.home}/Library/Containers/com.apple.TextEdit/Data/Library/Preferences/com.apple.TextEdit.plist".RichText = 0;
  };
}
