{ pkgs, ... }: {
  imports = [ ./common.nix ];

  environment.systemPackages = with pkgs; [
    gcc
  ];
}
