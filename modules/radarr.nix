{ pkgs, ...}:

{
    services.radarr = {
        enable = true;
        openFirewall = true;
    };

    services.nginx.virtualHosts."radarr.zemuria.lan" = {
      locations."/".proxyPass = "http://192.168.2.204:7878/";
    };
}