{ config, pkgs, ...} :

{
  programs.git = {
    enable = true;
    userName = "Ressobe";
    userEmail = "bartosz.sobina44@gmail.com";

    aliases = {
      s = "status";
      d = "diff";
      co = "checkout";
      ci = "commit";
      ca = "commit -a";
      ps = "push";
      pl = "pull";
      br = "branch";
    };
  };
}
