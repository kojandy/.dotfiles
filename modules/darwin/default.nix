{ pkgs, ... }: {
  imports = [
    ../common.nix
    ./apps.nix
    ./brew.nix
    ./preferences.nix
  ];

  environment.systemPackages = with pkgs; [
    ncdu

    gnupg

    entr
    unixtools.watch

    yt-dlp
    streamlink
    ffmpeg

    nodejs
    openjdk
    python3

    gh

    (texlive.combine {
      inherit (texlive) scheme-small latexmk
        cjk cjk-ko nanumtype1 kotex-plain kotex-utf kotex-utils
        kotex-oblivoir xpatch
        multirow lipsum;
    })
  ];

  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  security.sudo.extraConfig = "Defaults env_keep += \"TERM TERMINFO\"";
}
