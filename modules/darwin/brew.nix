_: {
  homebrew = {
    casks = [
      "alt-tab"
      "alfred"
      "bartender"
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
    ];

    masApps = {
      "Amphetamine" = 937984704;
      "Folder Preview" = 6698876601;
      "iPreview" = 1519213509;
      "Gestimer" = 990588172;
      "Yoink" = 457622435;

      "Todoist" = 585829637;

      "Boop" = 1518425043;
      "Jump Desktop" = 524141863;
      "Soulver 3" = 1508732804;
    };

    enable = true;
    onActivation.cleanup = "zap";
    onActivation.extraFlags = ["--quiet"];
    caskArgs.no_quarantine = true;
  };

  environment.variables.HOMEBREW_AUTO_UPDATE_SECS = "86400";
}
