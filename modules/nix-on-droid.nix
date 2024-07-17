{ pkgs, ... }:
  with (import ./common.nix { inherit pkgs; }); {
    home-manager.useGlobalPkgs = true;
    environment.packages = environment.systemPackages
      ++ (with pkgs; [
        openssh
      ]);

    user.shell = "${pkgs.zsh}/bin/zsh";
    terminal.font = "${pkgs.iosevka}/share/fonts/truetype/Iosevka-Regular.ttc";
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

    nix.extraOptions = nix.extraOptions;

    system.stateVersion = "24.05";
  }
