{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];



  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos-dev01";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  
  users.users.aria = {
     isNormalUser = true;
     initialHashedPassword = "$6$5mdi04UuXZNPWVXU$rwSZFrX2tggxwuUTmJtUihty0ps815sGRpjvnURwWjSBMgPRzVct6tMkyN3zZgZsGwbTR.eN3ji6i.hfFSOCh1";
     extraGroups = [ "wheel" ]; 
     openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaGzAqH/9U43Bcvj9XrIWH6urY8o6GzHxBrrQOkoPyuTqPxNQT623O8bCO4SvjaC3Ajv2CLSxDFoLkoxTNPx6YrHTNtNTJOUJT8HkhnxfZKrWRmOt4Xd9agLVbluxGrlgLasfjVF5c1JyWu1/QHh72xqki6mBCfaJMtYQJHH6mNKqtUr6OBPvtwEEd5DwNIDc/hUURTG8BvqGvt/voxmTxmNOnvf556PmHCrhNyPQ4w/bMhTVQnH8Yyj+hFKgVhpT5xg5C/YFicOgQJMFg0BpOBFXXahx5+LhFwSeSFxfNyRjYO78xMLpIKg+uEcc1vOPAn9Rp/6PSzWTztR87RLG89VBtnPjlzvuWDK4it7cUiYLFFMDJGxFw9hqRSkkv6MHN85mrGCtoHVRRMjHozKEfhzhwfQo/QpbiF/VKXy8SzkhQt7s9ZAMqhfwJkJsDPB8haeN3TJ3GfPjrKL+6R/iYFIvnV6gjFeKD45LEUc1TgZNtHlRiUNlrGot5FRz9NLk= aria@zemuria" ];  
     packages = with pkgs; [
       vim
       tree
       traceroute
      ];
   };

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

