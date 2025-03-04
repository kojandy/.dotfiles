{ pkgs, ... }: {
  homebrew.brews = [ "hbase" "pinot" ];

  environment.variables = {
    JAVA_8_HOME = "${pkgs.zulu8}";
    JAVA_11_HOME = "${pkgs.temurin-bin-11}";
    JAVA_17_HOME = "${pkgs.temurin-bin-17}";
  };
}
