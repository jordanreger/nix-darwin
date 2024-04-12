{ pkgs, ... }: {
  programs.helix = {
  
    enable = true;
    defaultEditor = true;

    languages = with pkgs; {
      language-server = {
        deno-lsp = {
          command = "${deno}/bin/deno";
          args = [ "lsp" "--unstable" ];
          config.deno = {
            enable = true;
            unstable = true;
            lint = true;
            suggest.imports.hosts = { "https://deno.land" = true; };
          };
        };
      };
      
      language = [
        { name = "go"; auto-format = true; }
        { name = "rust"; auto-format = true; }
        { name = "javascript"; language-servers = ["deno-lsp"]; auto-format = true; }
      ];
    };

    settings = {
      theme = "base16_transparent";
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
