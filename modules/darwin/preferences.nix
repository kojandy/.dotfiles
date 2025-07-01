_: {
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
      NewWindowTarget = "Home";
    };
    menuExtraClock.ShowSeconds = true;
    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyleSwitchesAutomatically = true;
      ApplePressAndHoldEnabled = false;
      "com.apple.sound.beep.feedback" = 0;
    };
    WindowManager.EnableStandardClickToShowDesktop = false;
    CustomUserPreferences = {
      "com.apple.dock" = {
        "size-immutable" = true;
        "contents-immutable" = true;
      };
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          "60" = { # 이전 입력 소스 선택
            enabled = true;
            value = {
              parameters = [32 49 1048576];
              type = "standard";
            };
          };
          "61".enabled = false; # 입력 메뉴에서 다음 소스 선택
          "64".enabled = false; # Spotlight 검색 보기
          "65".enabled = false; # Finder 검색 윈도우 보기
        };
      };
      NSGlobalDomain.NSToolbarTitleViewRolloverDelay = 0;
      "com.apple.assistant.support"."Assistant Enabled" = false;
    };
  };
}
