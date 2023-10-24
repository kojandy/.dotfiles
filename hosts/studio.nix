{ pkgs, ... }: {
  networking.computerName = "studio";

  homebrew = {
    brews = [
      "openjdk"
      "wakeonlan"
    ];
    casks = [
      "calibre"
      "discord"
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
    ];
  };
}
