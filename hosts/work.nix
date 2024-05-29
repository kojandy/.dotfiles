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
      "postgresql@14"
    ];
    casks = [
      "switchhosts"
      "wireshark"

      "zulu@8"
      "temurin@11"
      "temurin@17"
    ];
  };

  environment.variables = {
    JAVA_8_HOME = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home";
    JAVA_11_HOME = "/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home";
    JAVA_17_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home";
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Arc.app"
    "/Applications/WORKS.app"
    "/Applications/IntelliJ IDEA.app"
  ];
}
