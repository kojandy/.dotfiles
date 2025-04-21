{ inputs, pkgs, ... }: {
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  networking.hostName = "studio";

  home-manager.useGlobalPkgs = true;
  environment.systemPackages = with pkgs; [
    gnupg

    yt-dlp
    streamlink
    ffmpeg
  ];

  users.users."kojandy".home = "/Users/kojandy";
  home-manager.users."kojandy" = { config, ... }: {
    home.file = {
      ".profile".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/profile";
      ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/zsh/zshrc";
      "Library/Application Support/jj".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/jj";
      ".dotfiles/bin/littlesnitch".source = config.lib.file.mkOutOfStoreSymlink "/Applications/Little Snitch.app/Contents/Components/littlesnitch";
      "Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home".source = "${pkgs.zulu8}";
      "Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home".source = "${pkgs.temurin-bin-11}";
      "Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home".source = "${pkgs.temurin-bin-17}";
    };
    xdg.configFile = {
      "broot".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/broot";
      "git".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/git";
      "ideavim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/ideavim";
      "kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/kitty";
      "lf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/lf";
      "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim";
      "tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/tmux";
    };
    home.stateVersion = "25.05";
  };

  homebrew = {
    brews = [
      "m1ddc"
    ];
    casks = [
      "discord"
      "elgato-control-center"
      "elgato-stream-deck"
      "hancom-word-2014"
      "huiontablet"
      "jump-desktop-connect"
      "loopback"
      "minecraft"
      "mullvadvpn"
      "notion"
      "orbstack"
      "philips-hue-sync"
      "steam"
      "tailscale"
      "tetrio"
    ];
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Google Chrome.app"
    "/Applications/Home Assistant.app"
  ];
}
