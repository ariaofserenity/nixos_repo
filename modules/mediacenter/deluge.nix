{ pkgs, ...}:

{
    services.deluge = {
        enable = true;
        openFirewall = true;
    };
}