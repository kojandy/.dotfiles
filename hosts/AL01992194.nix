{ pkgs, ... }: {
  networking.computerName = "AL01992194";

  homebrew = {
    casks = [
      "mattermost"
    ];
  };
}
