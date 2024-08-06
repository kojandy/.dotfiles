{ pkgs, ... }: {
  networking.hostName = "studio";

  environment.systemPackages = with pkgs; [
    gnupg

    yt-dlp
    streamlink
    ffmpeg
  ];

  homebrew = {
    brews = [
      "wakeonlan"
    ];
    casks = [
      "calibre"
      "discord"
      "elgato-control-center"
      "elgato-stream-deck"
      "hancom-word-2014"
      "handbrake"
      "huiontablet"
      "jump-desktop-connect"
      "karabiner-elements"
      "loopback"
      "minecraft"
      "mullvadvpn"
      "notion"
      "orbstack"
      "philips-hue-sync"
      "steam"
      "tailscale"
      "tetrio"
      "unity-hub"
    ];
  };
}
