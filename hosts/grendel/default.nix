{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ../../hardware-configs/grendel-hardware.nix

      # Users
      ./../../users/aria/aria.nix

      # Modules
      ./../../modules/nfs/client.nix
      ./../../modules/radarr.nix
      ./../../modules/sonarr.nix
    ];

  networking ={
    useDHCP = false;
    hostName = "grendel";

    defaultGateway = "192.168.2.1";

    interfaces.ens18.ipv4 = {
      addresses = [{
        address = "192.168.2.204";
        prefixLength = 24;
      }];
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}

