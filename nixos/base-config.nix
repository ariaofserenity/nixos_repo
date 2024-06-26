{ config, lib, pkgs, ... }:

{
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  time.timeZone = "America/Toronto";

  networking.nameservers = [
      "192.168.2.9"
      "8.8.8.8"
    ];

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;

  };

   nixpkgs.config.allowUnfree = true;

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
    sops
    killall
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

