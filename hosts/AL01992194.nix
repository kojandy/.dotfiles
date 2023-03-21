{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    maven

    kubernetes-helm
    minikube
  ];

  homebrew = {
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
