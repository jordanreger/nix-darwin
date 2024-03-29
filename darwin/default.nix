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

  fonts.fontDir.enable = true;
  fonts.fonts = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  security.pam.enableSudoTouchIdAuth = true;
}
