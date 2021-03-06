{ config, pkgs, ... }:
{

  imports = [
    ./oh.nix
    ./powerlevel.nix
  ];

  environment = {
    pathsToLink = [ "/share/zsh" ];
  };

  programs.zsh = {
    autosuggestions = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    enable = true;
  };

  # enable completion for system packages (e.g. systemd)
  users.users.evanjs.shell = pkgs.zsh;
  users.users.root.shell = pkgs.zsh;
  
  fonts.fonts = with pkgs; [
    powerline-fonts
  ];
}
