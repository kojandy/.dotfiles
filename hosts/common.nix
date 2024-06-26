{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    tmux

    ripgrep
    fd
    broot
    lf

    htop

    git
  ];

  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  programs.zsh.enable = true;
}
