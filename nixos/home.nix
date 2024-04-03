{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball {
           url = "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
           sha256 = "1a2b1y8w7wm6shiawqic88j6sp6z43hq3p3852dgz6jbvj8lq5a1";
  };
in
{
    programs.home-manager.enable = true;
    home.username = "aria";
    home.homeDirectory = "/home/aria";
    home.stateVersion = "23.11";

}
