{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    lf
    ripgrep
    broot
    fzf
    fd

    httpie
    htop
    gnupg
    wakeonlan
    entr

    mas

    streamlink
    youtube-dl

    nodejs
    openjdk
  ];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  system.stateVersion = 4;
}
