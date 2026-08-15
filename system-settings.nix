{ ... }:
{
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 1.0e+08;
      autohide-time-modifier = 0.0;
      expose-group-apps = true;
      launchanim = false;
      mru-spaces = true;
      orientation = "bottom";
      persistent-apps = [];
      show-process-indicators = false;
      show-recents = false;
      showhidden = false;
      tilesize = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      FXRemoveOldTrashItems = true;
      NewWindowTarget = "PfHm";
      QuitMenuItem = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowScrollBars = "WhenScrolling";
      InitialKeyRepeat = 30;
      KeyRepeat = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      _HIHideMenuBar = true;
      "com.apple.swipescrolldirection" = false;
      "com.apple.trackpad.forceClick" = false;
    };

    screencapture = {
      location = "~/Documents";
      target = "clipboard";
    };

    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };

    menuExtraClock = {
      ShowAMPM = false;
      ShowDayOfWeek = true;
    };

    WindowManager = {
      EnableStandardClickToShowDesktop = false;
      EnableTiledWindowMargins = false;
      GloballyEnabled = false;
      StandardHideDesktopIcons = true;
      StandardHideWidgets = true;
    };

    loginwindow = {
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleAccentColor = 6;
        AppleMenuBarVisibleInFullscreen = false;
        CGDisableCursorLocationMagnification = true;
        "com.apple.sound.beep.volume" = 0;
        "com.apple.sound.uiaudio.enabled" = false;
      };

      "com.apple.Siri" = {
        StatusMenuVisible = false;
        VoiceTriggerUserEnabled = false;
      };

      "com.apple.assistant.support" = {
        "Assistant Enabled" = false;
      };

      "com.apple.gamed" = {
        GKOptedOutOfGameCenter = true;
      };
    };
  };
}
