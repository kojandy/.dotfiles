{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim

    lf
    broot
    ripgrep
    fd

    pyright
  ];

  system.stateVersion = "22.11";
}
