{ config, pkgs, ... }:
{
  services = {

    pgmanage = {
      enable = true;
    };

    postgresql = {
      authentication = pkgs.lib.mkOverride 10 ''
        local   all             all                                     trust
        host    all             all             127.0.0.1/32            trust
        host    all             all             ::1/128                 trust
        local   replication     all                                     trust
        host    replication     all             127.0.0.1/32            trust
        host    replication     all             ::1/128                 trust
      '';

      initialScript = pkgs.writeText "backend-initScript" ''
        CREATE DB copilot
      '';

      enable = true;
      enableTCPIP = true;
      package = pkgs.postgresql_10;
    };
  };
}
