{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../../hardware-configs/valimar-hardware.nix
      ./../../modules/users.nix
      ./../../modules/nfs/client.nix
    ];

  networking.hostName = "valimar";
  networking.networkmanager.enable = true;
  
  environment.systemPackages = with pkgs; [
    killall
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}

