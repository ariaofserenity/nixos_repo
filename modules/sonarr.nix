{ pkgs, ...}:

{
    services.sonarr = {
        enable = true;
        openFirewall = true;
    };

     services.nginx.virtualHosts."sonarr.zemuria.lan" = {
      locations."/".proxyPass = "http://192.168.2.204:8989/";
    };
}