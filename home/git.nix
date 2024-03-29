{ ... }: {
  programs.git = {
    enable = true;
    
    userName = "Jordan Reger";
    userEmail = "mail@jordanreger.com";

    extraConfig = {
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
    };
  };
}
