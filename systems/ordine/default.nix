{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ./ordine-hardware.nix

      # Users
      ./../../users/aria/aria.nix

      # Modules
      ./../../modules/nfs.nix
      ./../../modules/plex.nix
    ];

  networking ={
    useDHCP = false;
    hostName = "ordine";

    defaultGateway = "192.168.2.1";

    interfaces.ens18.ipv4 = {
      addresses = [{
        address = "192.168.2.203";
        prefixLength = 24;
      }];
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}