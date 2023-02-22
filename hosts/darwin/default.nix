{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    lf
    ripgrep
    broot
    fzf
    fd

    httpie
    htop
    gnupg
    wakeonlan
    entr

    mas

    streamlink
    youtube-dl

    nodejs
    openjdk
  ];

  homebrew = {
    enable = true;
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
    };
    casks = [
      "alfred"
      "bartender"
      "istat-menus"
      "little-snitch"
      "monitorcontrol"
      "soundsource"
      "karabiner-elements"
      "scroll-reverser"
      "gureumkim"

      "font-sarasa-gothic"

      "google-chrome"
      "iterm2"
      "obs"
      "zoom"
      "chatty"
    ];
  };

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
}
