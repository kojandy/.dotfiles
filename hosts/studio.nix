{ pkgs, ... }: {
  networking.computerName = "studio";

  homebrew = {
    brews = [
      "wakeonlan"
    ];
    casks = [
      "calibre"
      "discord"
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
      "philips-hue-sync"
      "steam"
      "tetrio"
      "unity"
    ];
  };
}
