{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/desktop.nix
    ../../hardware/profiles/wireless.nix

    ../../modules/development.nix
    ../../modules/scrape.nix
    ../../modules/steam.nix
    ../../modules/virtualization/virtualbox.nix
  ];

  networking.hostName = "nixtoo";

  system.stateVersion = "19.03";

  boot.kernelPackages = pkgs.linuxPackages_latest;
}