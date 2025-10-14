{ pkgs, ... }: {
  imports = [
    ../common.nix
    ./brew.nix
    ./preferences.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "amp-cli"
  ];

  environment.systemPackages = with pkgs; [
    ncdu

    entr
    unixtools.watch

    python3

    gh

    amp-cli

    (writeShellScriptBin "idea" ''
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
    '')
  ];

  system.activationScripts.extraActivation.text = ''
    ln -sf "${pkgs.temurin-bin-21}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
  '';

  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
