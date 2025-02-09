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
  ];

  nix.extraOptions = ''
      experimental-features = nix-command flakes
      commit-lockfile-summary = chore: update flake.lock
  '';
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  programs.zsh.enable = true;
}
