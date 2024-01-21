{config, lib, pkgs, ...}:

{
  networking.firewall.allowedTCPPorts = [ 6443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];

  environment.systemPackages = with pkgs; [ k3s ];

  sops.secrets.k3s_token = {
    sopsFile = ./secrets.yaml;
  };

  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://192.168.2.144:6443";
    tokenFile = config.sops.secrets.k3s_token.path;
  };
}