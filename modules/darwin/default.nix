{ inputs, pkgs, ... }: {
  imports = [
    ../common.nix
    ./brew.nix
    ./preferences.nix
    inputs.nix-index-database.darwinModules.default
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "claude-code"
  ];

  environment.systemPackages = with pkgs; [
    python3
    yubikey-manager

    docker
    kubectl
    kubernetes-helm
    k9s

    claude-code

    (writeShellScriptBin "idea" ''
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
    '')
  ];

  environment.variables = {
    RIPGREP_CONFIG_PATH = "$HOME/.dotfiles/config/rg/ripgreprc";
  };

  programs.nix-index.enable = false;
  programs.nix-index-database.comma.enable = true;

  system.activationScripts.extraActivation.text = ''
    ln -sf "${pkgs.temurin-bin-21}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
  '';

  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
