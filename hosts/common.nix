{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    tmux

    ripgrep
    fd
    broot
    lf
    delta
    difftastic

    htop
    httpie

    git
  ];

  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  programs.zsh.enable = true;
}
