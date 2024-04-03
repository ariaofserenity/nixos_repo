{ pkgs, ...}:

{
    services.qbittorrent = {
        enable = true;
        openFirewall = true;
    };
}