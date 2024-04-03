{ pkgs, ...}:

{
    services.jackett = {
        enable = true;
        openFirewall = true;
    };
    
    services.nginx.virtualHosts."grendel/jackett" = {
      locations."/".proxyPass = "http://localhost:9117/";
    };
}