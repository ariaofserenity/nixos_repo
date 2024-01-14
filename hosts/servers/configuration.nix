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
  
  networking.firewall.allowedTCPPorts = [ 80 443 22];
  # networking.firewall.allowedUDPPorts = [ ... ];
  

  # garbage collection
  nix.gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 7d";
        };



  environment.systemPackages = with pkgs; [
    fail2ban
    python3
    git
    killall
    wget
    curl
  ];

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
    bantime-increment = {
      enable = true;
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "168h";
      overalljails = true;
    };
  };
  
  system.stateVersion = "23.11"; # Did you read the comment?

}

