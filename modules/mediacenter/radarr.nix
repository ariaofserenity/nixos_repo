{ pkgs, ...}:

{
    services.radarr = {
        enable = true;
        openFirewall = true;
    };

    services.nginx.virtualHosts."radarr.grendel" = {
      locations."/".proxyPass = "http://localhost:7878/";
    };
}