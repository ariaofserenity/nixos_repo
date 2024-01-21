{config, lib, pkgs, ...}:

{
  networking.firewall.allowedTCPPorts = [ 6443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];

  environment.systemPackages = with pkgs; [ k3s ];

  sops.secrets.k3s_server_token = {
    sopsFile = ./secrets.yaml;
  };

  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };

  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://192.168.2.144:6443";
    tokenFile = config.sops.secrets.k3s_server_token.path;
  };
}