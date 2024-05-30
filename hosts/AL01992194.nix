{ pkgs, ... }: {
  networking.computerName = "AL01992194";

  homebrew = {
    casks = [
      "mattermost"
    ];
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Arc.app"
    "/Applications/WORKS.app"
    "/Applications/IntelliJ IDEA.app"
  ];
}
