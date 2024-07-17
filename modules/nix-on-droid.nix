{ pkgs, ... }:
  with (import ./common.nix { inherit pkgs; }); {
      environment.packages = environment.systemPackages;
      nix.extraOptions = nix.extraOptions;

      user.shell = "${pkgs.zsh}/bin/zsh";

      home-manager.config = { pkgs, ... }: {
        home.file = {
          ".zshrc".source = ../zsh/zshrc;
        };
        xdg.configFile = {
          "nvim".source = ../nvim;
        };
        home.stateVersion = "24.11";
      };

      system.stateVersion = "24.05";
    }
