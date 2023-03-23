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
      "pinot"
    ];
    casks = [
      "datagrip"
      "intellij-idea"

      "mattermost"
      "switchhosts"
      "wireshark"

      "zulu7"
      "temurin8"
      "adoptopenjdk9"
      "temurin11"
    ];
  };
}
