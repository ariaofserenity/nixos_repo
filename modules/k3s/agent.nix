{config, lib, pkgs, ...}:

{
  networking.firewall.allowedTCPPorts = [ 6443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];

  environment.systemPackages = with pkgs; [ k3s ];

  #sops.secrets.k3s_server_token = {
  #  sopsFile = ./secrets.yaml;
  #};

  services.k3s = {
    enable = false;
    serverAddr = "https://192.168.2.144:6443";
  };
}