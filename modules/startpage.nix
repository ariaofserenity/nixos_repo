{config, lib, pkgs, ...}:

{

    services.nginx.enable = true;

    services.nginx.virtualhosts."192.168.2.156" = {
        root = "/var/www/html";
    }
}