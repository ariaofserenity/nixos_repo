{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../../hardware-configs/valimar-hardware.nix
      ./../../modules/users.nix
      ./../../modules/nfs/client.nix
      ./../../modules/startpage.nix
    ];

  networking.hostName = "valimar";
  networking.networkmanager.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?

}

