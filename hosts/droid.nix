{ pkgs, ... }: {
  environment.packages = with pkgs; [
    neovim

    lf
    broot
    ripgrep
    fd

    git

    pyright
  ];

  system.stateVersion = "22.11";
  terminal.font = "${pkgs.sarasa-gothic}/share/fonts/truetype/sarasa-regular.ttc";
}
