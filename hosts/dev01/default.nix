{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/users.nix
      ./../../modules/k3s/server.nix
      ./../../modules/nfs/client.nix
    ];

  networking.hostName = "dev01";
  networking.networkmanager.enable = true;
  
  environment.systemPackages = with pkgs; [
    killall
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}

