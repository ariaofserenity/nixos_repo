{config, lib, pkgs, ...}:

{
    networking.firewall.allowedTCPPorts = [ 80 ];
    services.nginx.enable = true;

    services.nginx.virtualHosts."192.168.2.156" = {
        root = "/var/www/html";
    };
}