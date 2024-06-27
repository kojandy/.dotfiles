{ pkgs, ... }: {
  imports = [ ./common.nix ];

  environment.systemPackages = with pkgs; [
    ncdu

    gnupg

    entr
    unixtools.watch

    yt-dlp
    streamlink
    ffmpeg

    nodejs
    openjdk
    python3

    gh

    (texlive.combine {
      inherit (texlive) scheme-small latexmk
        cjk cjk-ko nanumtype1 kotex-plain kotex-utf kotex-utils
        kotex-oblivoir xpatch
        multirow lipsum;
    })
  ];

  homebrew = {
    enable = true;
    onActivation = {
        cleanup = "zap";
        extraFlags = ["--verbose"];
    };
    taps = [
      "homebrew/services"
      "nikitabobko/tap"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Gestimer" = 990588172;
      "Hand Mirror" = 1502839586;
      "HazeOver" = 430798174;
      "Yoink" = 457622435;

      "Todoist" = 585829637;

      "Boop" = 1518425043;
      "Jump Desktop" = 524141863;
      "Pixelmator Pro" = 1289583905;
      "Soulver 3" = 1508732804;
      "무비스트" = 461788075;
    };
    casks = [
      "aerospace"
      "alt-tab"

      "alfred"
      "bartender"
      "istat-menus"
      "little-snitch"
      "monitorcontrol"
      "soundsource"
      "scroll-reverser"
      "gureumkim"

      "font-sarasa-gothic"

      "google-chrome"
      "iterm2"
      "kitty"
      "obs"
      "zoom"
      "notion-calendar"
      "chatgpt"

      "intellij-idea"
      "gitbutler"
    ];
    caskArgs.no_quarantine = true;
  };

  environment.variables = {
    HOMEBREW_AUTO_UPDATE_SECS = "86400";
  };

  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {
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
      CustomUserPreferences = {
        "com.apple.dock" = {
          "size-immutable" = true;
        };
      };
    };
  };
}
