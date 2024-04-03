{ pkgs, ...}:

{
    services.jackett = {
        enable = true;
        openFirewall = true;
    };
    
    services.nginx.virtualHosts."jackett.grendel" = {
      locations."/".proxyPass = "http://localhost:9117/";
    };
}