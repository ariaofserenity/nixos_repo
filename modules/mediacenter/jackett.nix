{ pkgs, ...}:

{
    services.jackett = {
        enable = true;
        openFirewall = true;
    };
    
    services.nginx.virtualHosts."jackett.zemuria.lan" = {
      locations."/".proxyPass = "http://192.168.2.204:9117/";
    };
}