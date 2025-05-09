{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    tmux
    nodejs

    ripgrep
    fd
    broot
    lf
    difftastic
    lnav

    htop
    httpie

    git
    jujutsu

    nh
  ];

  nix.extraOptions = ''
      experimental-features = nix-command flakes
      commit-lockfile-summary = chore: update flake.lock
  '';
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  programs.zsh.enable = true;
}
