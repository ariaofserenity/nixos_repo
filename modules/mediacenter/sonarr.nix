{ pkgs, ...}:

{
    services.sonarr = {
        enable = true;
        openFirewall = true;
    };

     services.nginx.virtualHosts."sonarr.grendel" = {
      locations."/".proxyPass = "http://localhost:7878/";
    };
}