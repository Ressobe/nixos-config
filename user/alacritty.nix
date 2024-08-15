{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
        normal = {
          family = "Hack Nerd Font";
          style = "Normal";
        };
      };
      window = {
        opacity = 0.95;
        padding.x = 15;
        padding.y = 12;
      };

      colors = {
        primary = {
          background = "#121212";
          foreground = "#d3c6aa";
          dim_foreground = "#7f849c";
          bright_foreground = "#d3c6aa";
        };

        cursor = {
          text = "#2d353b";
          cursor = "#d3c6aa";
        };

        vi_mode_cursor = {
          text = "#2d353b";
          cursor = "#d3c6aa";
        };

        search.matches = {
          foreground = "#2d353b";
          background = "#7fbbb3";
        };

        search.focused_match = {
          foreground = "#2d353b";
          background = "#a7c080";
        };

        footer_bar = {
          foreground = "#2d353b";
          background = "#7fbbb3";
        };

        hints.start = {
          foreground = "#2d353b";
          background = "#dbbc7f";
        };

        hints.end = {
          foreground = "#2d353b";
          background = "#7fbbb3";
        };

        selection = { 
          text = "#2d353b";
          background = "#d3c6aa";
        };

        normal = {
          black = "#475258";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };

        bright = {
          black = "#475258";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };

        dim = {
          black = "#475258";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };
      };
    };
  };
}
