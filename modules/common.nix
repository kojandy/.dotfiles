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
    jujutsu
  ];

  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  programs.zsh.enable = true;
}
