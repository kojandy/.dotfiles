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
      ".profile".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/profile";
      ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zsh/zshrc";
      "Library/Application Support/jj".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/jj";
    };
    xdg.configFile = {
      "broot".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/broot";
      "git".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/git";
      "ideavim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/ideavim";
      "kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/kitty";
      "lf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/lf";
      "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
      "tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/tmux";
    };
    home.stateVersion = "24.11";
  };

  homebrew = {
    brews = [
      "wakeonlan"
    ];
    casks = [
      "calibre"
      "discord"
      "elgato-control-center"
      "elgato-stream-deck"
      "hancom-word-2014"
      "handbrake"
      "huiontablet"
      "jump-desktop-connect"
      "karabiner-elements"
      "loopback"
      "minecraft"
      "mullvadvpn"
      "notion"
      "orbstack"
      "philips-hue-sync"
      "steam"
      "tailscale"
      "tetrio"
      "unity-hub"
    ];
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Google Chrome.app"
    "/Applications/Home Assistant.app"
  ];
}
