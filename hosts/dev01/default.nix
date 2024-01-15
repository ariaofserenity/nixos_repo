{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/users.nix
    ];

  networking.hostName = "web01";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    httpd
  ];
  
  system.stateVersion = "23.11"; # Did you read the comment?

}

