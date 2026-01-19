{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    tmux
    nodejs cargo # for language servers

    ripgrep fd ast-grep
    broot lf
    difftastic
    unixtools.watch
    lnav

    htop
    httpie

    git
    jujutsu jjui

    nh
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    commit-lockfile-summary = "chore: update flake.lock";
    extra-substituters = "https://kojandy.cachix.org";
    extra-trusted-public-keys = "kojandy.cachix.org-1:HyuwXDaJ1ub3Kooeec/gkXv76Uk/YWBc3HxW8jQB+gs=";
  };
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.channel.enable = false;

  programs.zsh.enable = true;
}
