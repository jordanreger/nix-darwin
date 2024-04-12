{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      #theme = "josh";
      #theme = "sammy";
      theme = "jtriley";
      #theme = "";
    };

    initExtra = ''
      RPROMPT=""
      unalias 9
    '';
  };
}
