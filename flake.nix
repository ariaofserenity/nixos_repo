{
  description = "home lab config";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }:
    let 
       user = "aria";
       system = "x86_64-linux";
       pkgs = import nixpkgs;
    in {
     nixosConfigurations = {
      
      "elysium" = nixpkgs.lib.nixosSystem {
         inherit system;
         specialArgs = {inherit user;};
         modules = [ ./hosts/elysium
         ./modules/base-config.nix
         sops-nix.nixosModules.sops


	    home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {inherit user;};
            home-manager.users.${user} = import ./modules/home.nix;
        }
       ]; 
      };

        "valimar" = nixpkgs.lib.nixosSystem {
         inherit system;
         specialArgs = {inherit user;};
         modules = [ ./hosts/valimar
         ./modules/base-config.nix
         sops-nix.nixosModules.sops

	    home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {inherit user;};
            home-manager.users.${user} = import ./modules/home.nix;
        }
       ]; 
      };

      "ordine" = nixpkgs.lib.nixosSystem {
         inherit system;
         specialArgs = {inherit user;};
         modules = [ ./hosts/ordine
         ./modules/base-config.nix
         sops-nix.nixosModules.sops

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
