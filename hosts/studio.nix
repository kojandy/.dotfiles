{ inputs, pkgs, ... }: {
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  networking.hostName = "studio";

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "amp-cli"
  ];

  home-manager.useGlobalPkgs = true;
  environment.systemPackages = with pkgs; [
    gnupg

    yt-dlp
    streamlink
    ffmpeg

    amp-cli
  ];

  system.primaryUser = "kojandy";

  users.users."kojandy".home = "/Users/kojandy";
  home-manager.users."kojandy" = { config, ... }: {
    home.file = {
      ".profile".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/profile";
      ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/zsh/zshrc";
      ".dotfiles/bin/littlesnitch".source = config.lib.file.mkOutOfStoreSymlink "/Applications/Little Snitch.app/Contents/Components/littlesnitch";
      "Library/Java/JavaVirtualMachines/zulu-8.jdk".source = "${pkgs.zulu8}/Library/Java/JavaVirtualMachines/zulu-8.jdk";
      "Library/Java/JavaVirtualMachines/temurin-11.jdk".source = "${pkgs.temurin-bin-11}/Library/Java/JavaVirtualMachines/temurin-11.jdk";
      "Library/Java/JavaVirtualMachines/temurin-17.jdk".source = "${pkgs.temurin-bin-17}/Library/Java/JavaVirtualMachines/temurin-17.jdk";
    };
    xdg.configFile = {
      "broot".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/broot";
      "git".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/git";
      "ideavim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/ideavim";
      "jj".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/jj";
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
      "1password"
      "cleanshot"
      "daisydisk"
      "discord"
      "elgato-control-center"
      "elgato-stream-deck"
      "huiontablet"
      "insta360-link-controller"
      "izotope-product-portal"
      "jump-desktop-connect"
      "localsend"
      "loopback"
      "minecraft"
      "monitorcontrol"
      "mullvad-vpn"
      "notion"
      "obs"
      "orbstack"
      "philips-hue-sync"
      "steam"
      "tailscale-app"
      "tetrio"
      "utm"
      "waves-central"
    ];
    masApps = {
      "Droplr" = 498672703;
      "Gifski" = 1351639930;
      "Pixelmator Pro" = 1289583905;
      "무비스트" = 461788075;
    };
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Google Chrome.app"
    "/Applications/Home Assistant.app"
    "/Applications/Totalmix.app"
  ];
}
