{ pkgs, ...}:

{
    services.plex = {
        enable = true;
        openFirewall = true;
    };

    services.nginx.virtualHosts."plex.zemuria.lan" = {
      locations."/".proxyPass = "http://192.168.2.203:32400/";
    };
}

