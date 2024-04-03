{ pkgs, ...}:

{
    services.qBittorrent = {
        enable = true;
        openFirewall = true;
    };
}