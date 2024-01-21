{ config, lib, pkgs, ... }:

{
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  time.timeZone = "America/Toronto";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
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
    wget
    curl
    age
  ];

  virtualisation.docker.enable = true;

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

}

