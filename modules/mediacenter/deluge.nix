{ pkgs, ...}:

{
    services.deluge = {
        enable = true;
        openFirewall = true;

        web {
            enable = true;
        };
        }
    };
}