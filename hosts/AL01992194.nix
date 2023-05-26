{ pkgs, ... }: {
  networking.computerName = "AL01992194";

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
      "hbase"
    ];
    casks = [
      "datagrip"
      "intellij-idea"

      "mattermost"
      "switchhosts"
      "wireshark"

      "zulu7"
      "temurin8"
      {
        name = "adoptopenjdk9";
        args = {no_quarantine = true;};
      }
      "temurin11"
    ];
  };
}
