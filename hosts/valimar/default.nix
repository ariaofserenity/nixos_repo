{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      # hardware
      ../../hardware-configs/valimar-hardware.nix
      
      # Users
      ./../../users/aria/aria.nix
      
      # Modules
      ./../../modules/nfs/client.nix
      ./../../modules/startpage.nix
    ];

  networking ={
    useDHCP = false;
    hostName = "valimar";

    defaultGateway = "192.168.2.1";

    interfaces.ens18.ipv4 = {
      addresses = [{
        address = "192.168.2.202";
        prefixLength = 24;
      }];
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}

