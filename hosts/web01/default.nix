{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/users.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos-dev01";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  
  networking.firewall.allowedTCPPorts = [ 80 443 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  

  # garbage collection
  nix.gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 7d";
        };
  
  system.stateVersion = "23.11"; # Did you read the comment?

}

