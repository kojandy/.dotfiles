_: {
  homebrew = {
    taps = [ "typester/yashiki" ];
    casks = [
      "alfred"
      "istat-menus@6"
      "little-snitch"
      "scroll-reverser"
      "gureumkim"

      "font-sarasa-gothic"

      "google-chrome"
      "kitty"
      "zoom"
      "morgen"
      "chatgpt"

      "intellij-idea"
      "codex-app"

      "typester/yashiki/yashiki"
    ];

    masApps = {
      "Amphetamine" = 937984704;
      "Folder Preview" = 6698876601;
      "iPreview" = 1519213509;
      "Gestimer" = 990588172;
      "Yoink" = 457622435;

      "Boop" = 1518425043;
      "Jump Desktop" = 524141863;
      "Soulver 3" = 1508732804;
    };

    enable = true;
    onActivation.cleanup = "zap";
    onActivation.extraFlags = [
      "--quiet"

      # https://github.com/nix-darwin/nix-darwin/issues/1787
      "--force-cleanup"
    ];
  };

  environment.variables.HOMEBREW_AUTO_UPDATE_SECS = "86400";
}
