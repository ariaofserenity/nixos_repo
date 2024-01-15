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
    killall
    nginx
  ];

  services.nginx = {
    enable = true;
    
    virtualHosts."/" = {
        root = "/var/www/browser";
    };
  };
  
  system.stateVersion = "23.11"; # Did you read the comment?

}

