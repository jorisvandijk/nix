{ ... }:
{
  system.defaults = {

    dock = {
      autohide = true;                    # Auto-hide the dock
      autohide-delay = 1.0e+08;           # Delay before dock appears on hover (huge = never)
      autohide-time-modifier = 0.0;       # Duration of show/hide animation (0 = instant)
      expose-group-apps = true;           # Group windows by app in Mission Control
      launchanim = false;                 # Animate opening applications
      mru-spaces = true;                  # Auto-rearrange Spaces based on recent use
      no-bouncing = true;                 # Bounce app icon in dock when it needs attention
      orientation = "bottom";            # Dock position: "left", "bottom", or "right"
      persistent-apps = [];              # Apps pinned to the dock (empty = none)
      show-process-indicators = false;    # Show dots under running apps
      show-recents = false;               # Show recently used apps in dock
      showhidden = false;                 # Show hidden app icons as translucent
      tilesize = 1;                       # Dock icon size in pixels
      wvous-tl-corner = 1;               # Top-left hot corner action (1 = disabled)
      wvous-tr-corner = 1;               # Top-right hot corner action (1 = disabled)
      wvous-bl-corner = 1;               # Bottom-left hot corner action (1 = disabled)
      wvous-br-corner = 1;               # Bottom-right hot corner action (1 = disabled)
    };

    finder = {
      AppleShowAllExtensions = true;      # Show all file extensions
      FXDefaultSearchScope = "SCcf";      # Default search scope: "SCcf" = current folder, "SCev" = everywhere
      FXEnableExtensionChangeWarning = false; # Warn when changing a file extension
      FXPreferredViewStyle = "Nlsv";      # Default view: "Nlsv" = list, "icnv" = icon, "clmv" = column, "Flwv" = gallery
      FXRemoveOldTrashItems = true;       # Auto-remove trash items after 30 days
      NewWindowTarget = "PfHm";          # New window opens: "PfHm" = home, "PfDe" = desktop, "PfDo" = documents
      QuitMenuItem = true;               # Show Quit option in Finder menu
      ShowExternalHardDrivesOnDesktop = false; # Show external drives on desktop
      ShowHardDrivesOnDesktop = false;    # Show internal drives on desktop
      ShowPathbar = true;                 # Show path bar at bottom of Finder window
      ShowRemovableMediaOnDesktop = false; # Show USB/SD cards on desktop
      ShowStatusBar = true;               # Show status bar at bottom of Finder window
    };

    NSGlobalDomain = {
      AppleAccentColor = 6;              # Accent colour: -1=graphite 0=red 1=orange 2=yellow 3=green 4=blue 5=purple 6=pink
      AppleHighlightColor = "1.000000 0.749020 0.823529 Pink"; # Text selection highlight colour
      AppleInterfaceStyle = "Dark";      # Colour scheme: "Dark" or remove line for light
      AppleMiniaturizeOnDoubleClick = false; # Double-click window title bar to minimise
      AppleShowScrollBars = "WhenScrolling"; # Show scroll bars: "WhenScrolling", "Automatic", or "Always"
      InitialKeyRepeat = 30;             # Delay before key repeat starts (lower = shorter, default 68)
      KeyRepeat = 2;                     # Key repeat rate (lower = faster, default 6)
      NSAutomaticCapitalizationEnabled = false; # Auto-capitalise first word of sentence
      NSAutomaticPeriodSubstitutionEnabled = false; # Insert period when double-tapping space
      NSAutomaticSpellingCorrectionEnabled = false; # Auto-correct spelling
      _HIHideMenuBar = true;             # Auto-hide the menu bar
      "com.apple.swipescrolldirection" = false; # Natural (reversed) scroll direction
      "com.apple.trackpad.forceClick" = false;  # Force click (press hard) on trackpad
    };

    screencapture = {
      location = "~/Documents";          # Default save location for screenshots
      target = "clipboard";             # Screenshot destination: "clipboard" or "file"
    };

    screensaver = {
      askForPassword = true;             # Require password after screensaver or sleep
      askForPasswordDelay = 0;           # Seconds before password is required (0 = immediately)
    };

    trackpad = {
      Clicking = true;                   # Tap to click (without pressing down)
      TrackpadThreeFingerDrag = true;    # Drag windows with three fingers
    };

    menuExtraClock = {
      ShowAMPM = true;                   # Show AM/PM in menu bar clock
      ShowDayOfWeek = true;              # Show day of week in menu bar clock
    };

    WindowManager = {
      EnableStandardClickToShowDesktop = false; # Click desktop to reveal it (when windows cover it)
      EnableTiledWindowMargins = false;   # Show margins/gaps between tiled windows
      GloballyEnabled = false;           # Stage Manager on/off
      StandardHideDesktopIcons = true;   # Hide icons on desktop (standard/non-Stage-Manager mode)
      StandardHideWidgets = true;        # Hide widgets on desktop
    };

    loginwindow = {
      TALLogoutSavesState = false;       # Reopen apps after logout or restart
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleMenuBarVisibleInFullscreen = false; # Show menu bar when in fullscreen
        CGDisableCursorLocationMagnification = true; # Shake mouse pointer to locate cursor
        "com.apple.sound.beep.volume" = 0;       # System alert volume (0.0–1.0)
        "com.apple.sound.uiaudio.enabled" = false; # UI sound effects (e.g. empty trash sound)
      };
      "com.apple.Siri" = {
        StatusMenuVisible = false;       # Show Siri in menu bar
        VoiceTriggerUserEnabled = false; # "Hey Siri" voice activation
      };
      "com.apple.assistant.support" = {
        "Assistant Enabled" = false;     # Siri enabled
      };
      "com.apple.gamed" = {
        GKOptedOutOfGameCenter = true;   # Game Center participation
      };
    };

  };
}
