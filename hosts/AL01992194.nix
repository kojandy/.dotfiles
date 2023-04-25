{ pkgs, ... }: {
  networking.computerName = "AL01992194";

  environment.systemPackages = with pkgs; [
    maven
    nodePackages.node-gyp

    kubernetes-helm
    minikube
    kubectl

    (writeShellScriptBin "jdtls" "exec -a $0 ${jdt-language-server}/bin/jdt-language-server $@")
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
      "adoptopenjdk9"
      "temurin11"
    ];
  };
}
