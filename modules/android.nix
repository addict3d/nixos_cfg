{ config, pkgs, ... }:
{
  nixpkgs.config = {
    android_sdk.accept_license = true;
  };

  programs.adb.enable = true;
}
