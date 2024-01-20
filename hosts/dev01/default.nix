{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/users.nix
    ];

  networking.hostName = "dev01";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 22 6443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];
  
  environment.systemPackages = with pkgs; [
    killall
  ];

  services.k3s.enable = true;
  services.k3s.role = "server";
  
  environment.systemPackages = [ pkgs.k3s ];

  fileSystems."/mnt/common" = {
    device = "192.168.2.14:/mnt/d01/common";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" ];
  };



  system.stateVersion = "23.11"; # Did you read the comment?

}

