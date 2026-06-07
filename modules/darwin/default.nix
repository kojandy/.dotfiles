{ inputs, pkgs, ... }: {
  imports = [
    ../common.nix
    ./brew.nix
    ./preferences.nix
    inputs.nix-index-database.darwinModules.default
    inputs.paneru.darwinModules.paneru
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "claude-code"
  ];

  environment.systemPackages = with pkgs; [
    python3
    yubikey-manager

    docker
    kubectl
    kubernetes-helm
    k9s

    codex
    claude-code

    (writeShellScriptBin "idea" ''
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
    '')
  ];

  environment.variables = {
    RIPGREP_CONFIG_PATH = "$HOME/.dotfiles/config/rg/ripgreprc";
  };

  programs.nix-index.enable = false;
  programs.nix-index-database.comma.enable = true;

  services.skhd.enable = true;
  services.skhd.skhdConfig = builtins.readFile ../../config/skhd/skhdrc;

  services.paneru = {
    enable = true;
    settings = {
      options = {
        animation_speed = 20;
        window_resize_cycle = false;
      };
      padding = {
        top = 10;
        bottom = 10;
        left = 10;
        right = 10;
      };
      decorations = {
        workspace_popup_status = false;
      };
      swipe = {
        sensitivity = 0.15;
        deceleration = 10.0;
        gesture = {
          fingers_count = 4;
          vertical = false;
        };
      };
      bindings = {
        window_focus_west = "alt - h";
        window_focus_east = "alt - l";
        window_swap_west = "alt + shift - h";
        window_swap_east = "alt + shift - l";

        window_virtual_south = "alt - j";
        window_virtual_north = "alt - k";
        window_virtualsend_south = "alt + shift - j";
        window_virtualsend_north = "alt + shift - k";

        window_focus_north = "alt - ,";
        window_focus_south = "alt - .";
        window_stack = "alt + shift - ,";
        window_unstack = "alt + shift - .";

        window_shrink = "alt - minus";
        window_grow = "alt - equal";

        window_manage = "alt - s";
        window_fullwidth = "alt - z";

        window_focus_first = "alt - m";
        window_swap_first = "alt + shift - m";
        window_center = "alt - semicolon";

        mouse_nextdisplay = "alt - tab";
        window_nextdisplaysend = "alt + shift - tab";

        quit = "alt + shift - escape";

        window_virtualnum_1 = "alt - 1";
        window_virtualnum_2 = "alt - 2";
        window_virtualnum_3 = "alt - 3";
        window_virtualnum_4 = "alt - 4";
        window_virtualnum_5 = "alt - 5";
        window_virtualnum_6 = "alt - 6";
        window_virtualnum_7 = "alt - 7";
        window_virtualnum_8 = "alt - 8";
        window_virtualnum_9 = "alt - 9";
        window_virtualsendnum_1 = "alt + shift - 1";
        window_virtualsendnum_2 = "alt + shift - 2";
        window_virtualsendnum_3 = "alt + shift - 3";
        window_virtualsendnum_4 = "alt + shift - 4";
        window_virtualsendnum_5 = "alt + shift - 5";
        window_virtualsendnum_6 = "alt + shift - 6";
        window_virtualsendnum_7 = "alt + shift - 7";
        window_virtualsendnum_8 = "alt + shift - 8";
        window_virtualsendnum_9 = "alt + shift - 9";
      };
      windows = {
        "all" = {
          title = ".*";
          horizontal_padding = 5;
          vertical_padding = 5;
        };
        "morgen" = {
          title = ".*";
          bundle_id = "com.todesktop.210203cqcj00tw1";
          floating = true;
        };
        "preferences" = {
          title = ".*";
          bundle_id = "com.apple.systempreferences";
          floating = true;
        };
        "homeassistant" = {
          title = ".*";
          bundle_id = "io.robbie.HomeAssistant";
          floating = true;
        };
        "totalmix" = {
          title = ".*";
          bundle_id = "de.rme-audio.TotalmixFX";
          floating = true;
        };
        "kakaotalk" = {
          title = ".*";
          bundle_id = "com.kakao.KakaoTalkMac";
          floating = true;
        };
      };
      restore.enabled = false;
    };
  };

  system.activationScripts.extraActivation.text = ''
    ln -sf "${pkgs.temurin-bin-21}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
  '';

  security.pam.services.sudo_local.touchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";

  system.stateVersion = 5;
}
