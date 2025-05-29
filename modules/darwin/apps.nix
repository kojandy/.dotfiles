{ pkgs, ... }: {
  homebrew.brews = [
    "pueue"
  ];
  homebrew.casks = [
    "alt-tab"
    "alfred"
    "bartender"
    "istat-menus@6"
    "little-snitch"
    "monitorcontrol"
    "soundsource"
    "scroll-reverser"
    "gureumkim"

    "font-sarasa-gothic"

    "google-chrome"
    "kitty"
    "obs"
    "zoom"
    "morgen"
    "chatgpt"

    "intellij-idea"
  ];

  homebrew.masApps = {
    "Amphetamine" = 937984704;
    "Folder Preview" = 6698876601;
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

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "idea" ''
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
    '')
  ];
}
