{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    tmux

    lf
    broot
    ripgrep
    fd
    ncdu

    httpie
    htop
    gnupg

    entr
    unixtools.watch

    streamlink
    youtube-dl

    nodejs
    openjdk
    python3

    gh
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    brews = [
      "blueutil"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Gestimer" = 990588172;
      "Hand Mirror" = 1502839586;
      "HazeOver" = 430798174;

      "Craft" = 1487937127;
      "Todoist" = 585829637;

      "Boop" = 1518425043;
      "Jump Desktop" = 524141863;
      "Pixelmator Pro" = 1289583905;
      "Soulver 3" = 1508732804;
      "무비스트" = 461788075;

      "Toggl Track" = 1291898086;
    };
    casks = [
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
      "obs"
      "zoom"
      "chatty"
      "cron"

      "docker"

      "elgato-control-center"
      "elgato-stream-deck"
    ];
  };

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

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
