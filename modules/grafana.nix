{ pkgs, ...}:

{
    services.grafana = {
        enable = true;

        settings = {
            server = {
                http_addr = "127.0.0.1";
                http_port = 3000;

                domain = "zemuria.lan";
            };
            };
        };

        

}