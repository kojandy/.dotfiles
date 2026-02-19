{ inputs, pkgs, ... }: {
  imports = [
    ../common.nix
    ./brew.nix
    ./preferences.nix
    inputs.nix-index-database.darwinModules.default
  ];


  environment.systemPackages = with pkgs; [
    python3
    yubikey-manager

    docker
    kubectl
    kubernetes-helm
    k9s

    (writeShellScriptBin "idea" ''
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
    '')
  ];

  programs.nix-index.enable = false;
  programs.nix-index-database.comma.enable = true;

  system.activationScripts.extraActivation.text = ''
    ln -sf "${pkgs.temurin-bin-21}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
  '';

  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
