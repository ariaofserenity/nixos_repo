{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ../../hardware-configs/elysium-hardware.nix

      # Users
      ./../../users/aria/aria.nix

      # Modules
      ./../../modules/k3s/server.nix
      ./../../modules/nfs/client.nix
      ./../../modules/k3s/helm.nix
    ];

  networking ={
    useDHCP = false;
    hostName = "elysium";

    defaultGateway = "192.168.2.1";

    interfaces.ens18.ipv4 = {
      addresses = [{
        address = "192.168.2.201";
        prefixLength = 24;
      }];
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}

