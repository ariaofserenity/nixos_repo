{
  description = "Aria's flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let 
       user = "aria";
       system = "x86_64-linux";
    in {
     nixosConfigurations = {

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
      
      "web01" = nixpkgs.lib.nixosSystem {
         inherit system;
         specialArgs = {inherit user;};
         modules = [ ./hosts/web01


	    home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {inherit user;};
            home-manager.users.${user} = import ./modules/home.nix;
        }
       ]; 
      };
    };
  };
}
