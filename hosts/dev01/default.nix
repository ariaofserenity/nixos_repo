{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/users.nix
    ];

  networking.hostName = "web01";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 22 ];
  
  environment.systemPackages = with pkgs; [
    killall
    nginx
  ];

  services.nginx = {
    enable = true;
    
    virtualHosts."/" = {
        root = "/var/www/browser";
    };
  };

  fileSystems."/mnt/common" = {
    device = "192.168.2.14:/mnt/d01/common";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}

