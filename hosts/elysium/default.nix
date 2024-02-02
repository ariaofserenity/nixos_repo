{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../../hardware-configs/elysium-hardware.nix
      ./../../modules/users.nix
      ./../../modules/k3s/server.nix
      ./../../modules/nfs/client.nix
      ./../../modules/k3s/helm.nix
    ];

  networking.hostName = "elysium";
  networking.networkmanager.enable = true;
  
  environment.systemPackages = with pkgs; [
    killall
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}

