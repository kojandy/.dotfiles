{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    maven
    nodePackages.node-gyp

    kubernetes-helm
    minikube
    kubectl
  ];

  homebrew = {
    taps = [
      "homebrew/cask-versions"
    ];
    brews = [
      "hbase"
      "pinot"
      "postgresql"
    ];
    casks = [
      "mattermost"
      "switchhosts"
      "wireshark"

      "zulu8"
      "temurin11"
      "temurin17"
    ];
  };
}
