{config, lib, pkgs, ...}:

{
    networking.firewall.allowedTCPPorts = [ 80 ];
    services.nginx.enable = true;

    services.nginx.virtualHosts."startpage.zemuria.lan" = {
        root = "/var/www/html";
        locations."/".proxyPass = "http://192.168.2.202/";
    };
}