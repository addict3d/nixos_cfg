{ config, ... }:
{
  imports = [
    ./default.nix
  ];

  services.samba = {
    extraConfig = ''
      workgroup = home
    '';
  };

  fileSystems."/data/stores/" = {
    device = "//rig/private";
    fsType = "cifs";
    options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/home/evanjs/src/nixos_cfg/modules/samba/client/smb-secrets"];
  };
}
