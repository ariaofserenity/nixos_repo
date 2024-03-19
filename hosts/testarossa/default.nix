{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ../../hardware-configs/testarossa-hardware.nix

      # Users
      ./../../users/aria/aria.nix

      # Modules
      ./../../modules/nfs/client.nix
      ./../../modules/sonarr.nix
      ./../../modules/radarr.nix
      ./../../modules/plex.nix
    ];

  networking ={
    useDHCP = false;
    hostName = "testarossa";

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