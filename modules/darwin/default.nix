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

    python3

    gh
  ];

  system.activationScripts.extraActivation.text = ''
    ln -sf "${pkgs.temurin-bin-21}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
  '';

  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
