{ pkgs, ... }: {
  networking.computerName = "AL02360247";

  homebrew = {
    casks = [
      "elgato-control-center"
    ];
  };
}
