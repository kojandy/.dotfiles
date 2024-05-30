{ pkgs, ... }: {
  networking.computerName = "AL02360247";

  homebrew = {
    casks = [
      "elgato-control-center"
    ];
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Google Chrome.app"
    "/Applications/WORKS.app"
    "/Applications/IntelliJ IDEA.app"
  ];
}
