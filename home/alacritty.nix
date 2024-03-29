{ pkgs, ... }: {
  programs.alacritty = {
  
    enable = true;

    settings = {
      live_config_reload = true;

      # https://github.com/kvrohit/rasmus.nvim/blob/main/extras/alacritty/rasmus.yaml
      colors = {
        primary = {
          background = "#1a1a19";
          foreground = "#d1d1d1";
        };

        cursor = {
          text =   "#1a1a19";
          cursor = "#d1d1d1";
        };

        normal = {
          black = "#333332";
          red = "#ff968c";
          green = "#61957f";
          yellow = "#ffc591";
          blue = "#8db4d4";
          magenta = "#de9bc8";
          cyan = "#7bb099";
          white = "#d1d1d1";
        };

        bright = {
          black = "#4c4c4b";
          red = "#ffafa5";
          green = "#7aae98";
          yellow = "#ffdeaa";
          blue = "#a6cded";
          magenta = "#f7b4e1";
          cyan = "#94c9b2";
          white = "#eaeaea";
        };
      };
      
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 12;
      };

      shell = {
        program = "${pkgs.zsh}/bin/zsh";
      };
      
      window = {
        dimensions = {
          lines = 35;
          columns = 125;
        };

        padding = {
          x = 10;
          y = 0;
        };
        dynamic_padding = true;

        decorations = "None";
      };
    };
    
  };
}
