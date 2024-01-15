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
       pkgs = import nixpkgs;
    in {
     nixosConfigurations = {
      
      "web01" = nixpkgs.lib.nixosSystem {
         inherit system;
         specialArgs = {inherit user;};
         modules = [ ./hosts/web01
         ./modules/base-config.nix


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
