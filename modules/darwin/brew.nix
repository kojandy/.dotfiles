_: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.extraFlags = ["--quiet"];
    caskArgs.no_quarantine = true;
    taps = [ "homebrew/services" ];
  };

  environment.variables.HOMEBREW_AUTO_UPDATE_SECS = "86400";
}
