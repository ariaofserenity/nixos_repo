{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../../hardware-configs/dev02-hardware.nix
      ./../../modules/users.nix
      ./../../modules/k3s/agent.nix
      ./../../modules/nfs/client.nix
    ];

  networking.hostName = "dev02";
  networking.networkmanager.enable = true;
  
  environment.systemPackages = with pkgs; [
    killall
  ];
  
  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}

