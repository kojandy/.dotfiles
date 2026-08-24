{ inputs, pkgs, ... }:
let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in
{
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

    gh
    llm-agents.tuicr

    nono
    ccusage
    codexbar
    llm-agents.codex
    llm-agents.claude-code
    llm-agents.agent-deck
    llm-agents.pi

    jankyborders

    (writeShellScriptBin "idea" ''
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
    '')
  ];

  environment.variables = {
    RIPGREP_CONFIG_PATH = "$HOME/.dotfiles/config/rg/ripgreprc";
  };

  programs.nix-index.enable = false;
  programs.nix-index-database.comma.enable = true;

  services.skhd.enable = true;
  services.skhd.skhdConfig = builtins.readFile ../../config/skhd/skhdrc;

  system.activationScripts.extraActivation.text = ''
    ln -sf "${pkgs.temurin-bin-21}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
  '';

  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
