{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ./grendel-hardware.nix

      # Users
      ./../../users/aria/aria.nix

      # Modules
      ./../../modules/nfs.nix
      ./../../modules/nginx.nix
      ./../../modules/radarr.nix
      ./../../modules/sonarr.nix
      ./../../modules/jackett.nix
      ./../../modules/deluge.nix
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

  sops = {
    age.sshKeyPaths = mkDefault [ "/etc/ssh/ssh_host_ed25519_key" ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}

