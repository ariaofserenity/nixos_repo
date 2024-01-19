{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/users.nix
    ];

  networking.hostName = "core01";
  networking.networkmanager.enable = true;
  
  system.stateVersion = "23.11"; # Did you read the comment?

}