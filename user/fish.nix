{ config, pkgs, ...} :

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
          set fish_greeting # Disable greeting
    '';
    shellAbbrs = {
      c = "clear";
      n = "nvim";
      ls = "eza --icons";
      l = "eza --icons ";
      ll = "eza --icons -ahl";
      lt = "eza --tree";
      cd = "z";
      g = "git";
    };
    functions = {
      fish_prompt = {
        body = ''
          set_color red --bold
          printf "["
          set_color yellow
          printf "%s" "$USER"
          set_color green
          printf "@"
          set_color blue
          printf "%s" "$hostname"
          set_color magenta
          printf " %s" "$PWD"
          set_color red
          printf "] "
          set_color normal
        '';
      };
    };
    shellInitLast = "zoxide init fish | source | fish_config theme choose Dracula";
  };
}
