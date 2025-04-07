{ pkgs, ... }: {
  imports = [
    ../common.nix
    ./apps.nix
    ./brew.nix
    ./preferences.nix
  ];

  environment.systemPackages = with pkgs; [
    ncdu

    entr
    unixtools.watch

    temurin-bin-21
    python3

    gh
  ];

  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
