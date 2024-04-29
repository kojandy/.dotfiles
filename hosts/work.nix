{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    maven
    nodePackages.node-gyp

    kubernetes-helm
    minikube
    kubectl
  ];

  homebrew = {
    brews = [
      "hbase"
      "pinot"
      "postgresql"
    ];
    casks = [
      "switchhosts"
      "wireshark"

      "zulu@8"
      "temurin@11"
      "temurin@17"
    ];
  };
}
