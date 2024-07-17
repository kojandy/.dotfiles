{ pkgs, ... }: {
  home-manager.config = { pkgs, ... }: {
    home.file = {
      ".profile".source = ../profile;
      ".zshrc".source = ../zsh/zshrc;
    };
    xdg.configFile = {
      "nvim".source = ../nvim;
      "git".source = ../git;
      "lf".source = ../lf;
      "broot".source = ../broot;
      "tmux".source = ../tmux;
      "jj".source = ../jj;
    };
    home.stateVersion = "24.05";
  };
}
