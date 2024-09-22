{ ... }: {
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.defaults = {
    dock = {
      show-recents = false;
      showhidden = true;
      tilesize = 64;
      wvous-br-corner = 1;
    };
    finder = {
      AppleShowAllExtensions = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
    };
    menuExtraClock.ShowSeconds = true;
    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };
    NSGlobalDomain = {
      AppleInterfaceStyleSwitchesAutomatically = true;
      ApplePressAndHoldEnabled = false;
      AppleICUForce24HourTime = true;
    };
    WindowManager.EnableStandardClickToShowDesktop = false;
    CustomUserPreferences = {
      "com.apple.dock" = {
        "size-immutable" = true;
        "contents-immutable" = true;
      };
    };
  };
}
