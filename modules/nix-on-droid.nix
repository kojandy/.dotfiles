{ inputs, pkgs, ... }:
  with (import ./common.nix { inherit inputs pkgs; }); {
    home-manager.useGlobalPkgs = true;
    environment.packages = environment.systemPackages
      ++ (with pkgs; [
        zsh
        openssh
        curl wget
        gnutar gzip unzip
        gcc

        gnugrep gnused

        yt-dlp streamlink
      ]);

    home-manager.config = { config, ... }: {
      nix.package = pkgs.nix;
      nix.settings = nix.settings;
      home = {
        file = {
          ".profile".source = ../config/profile;
          ".zshrc".source = ../config/zsh/zshrc;
          "Downloads".source = config.lib.file.mkOutOfStoreSymlink "/sdcard/Download";
        };
        stateVersion = "25.05";
        enableNixpkgsReleaseCheck = false;
      };
      xdg.configFile = {
        "nvim".source = ../config/nvim;
        "git".source = ../config/git;
        "lf".source = ../config/lf;
        "broot".source = ../config/broot;
        "tmux".source = ../config/tmux;
        "jj".source = ../config/jj;
      };
    };

    user.shell = "${pkgs.zsh}/bin/zsh";
    terminal.font = "${pkgs.iosevka}/share/fonts/truetype/Iosevka-Regular.ttf";
    terminal.colors = {
      foreground = "#c5c8c6";
      background = "#1d1f21";
      cursor = "#c5c8c6";
      color0 = "#282a2e";
      color8 = "#373b41";
      color1 = "#a54242";
      color9 = "#cc6666";
      color2 = "#8c9440";
      color10 = "#b5bd68";
      color3 = "#de935f";
      color11 = "#f0c674";
      color4 = "#5f819d";
      color12 = "#81a2be";
      color5 = "#85678f";
      color13 = "#b294bb";
      color6 = "#5e8d87";
      color14 = "#8abeb7";
      color7 = "#707880";
      color15 = "#c5c8c6";
    };

    nix.registry.nixpkgs.flake = nix.registry.nixpkgs.flake;

    environment.motd = null;

    system.stateVersion = "24.05";
  }
