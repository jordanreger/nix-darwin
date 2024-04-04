{ ... }: {
  programs.helix = {
  
    enable = true;
    defaultEditor = true;

    languages = {
      language = [
        { name = "go"; auto-format = true; }
        { name = "rust"; auto-format = true; }
      ];
    };

    settings = {
      theme = "base16_terminal";
      editor = {
        line-number = "relative";
        rulers = [60 80];
        true-color = true;

        soft-wrap = {
          enable = true;
          wrap-indicator = "";
        };

        cursor-shape = {
          insert = "bar";
        };
      };

      keys.normal = {
        space.f = "file_picker_in_current_directory";
      };
    };

    themes = {
      transparent_rasmus = {
        "inherits" = "rasmus";
        "ui.virtual" = { fg = "gray03"; };
        "ui.virtual.ruler" = { bg = "gray03"; };

        "ui.background" = "none";
      };
    };
    
  };
}
