{ pkgs, username, system, ... } @ inputs:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.auto-optimise-store = true;

  # KEEP THIS IT'S EXTREMELY IMPORTANT OTHERWISE EVERYTHING WILL BREAK!
  programs.zsh.enable = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = system;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  #fonts.fontDir.enable = true;
  #fonts.fonts = [
  #  (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  #];

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleTemperatureUnit = "Celsius";
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      # Natural scrolling
      "com.apple.swipescrolldirection" = true;
      "com.apple.trackpad.enableSecondaryClick" = true;
      # Enable right click
      "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
    };
    dock = {
      autohide = true;
      show-recents = false;
      tilesize = 44;
      wvous-br-corner = 14; # Quick Note
    };

    finder = {
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "nlsv"; # List view
      ShowPathbar = true;
    };

    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 0;
    };

    trackpad = {
      TrackpadRightClick = true;
    };
  };

  time.timeZone = "America/New_York";
}
