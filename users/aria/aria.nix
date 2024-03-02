{config, pkgs, lib, inputs, user, ...}:

let 
   pubKeys = import ./pubkeys.nix;
in {
  users.users.${user} = {
     isNormalUser = true;
     description = "${user}";
     initialHashedPassword = "$6$5mdi04UuXZNPWVXU$rwSZFrX2tggxwuUTmJtUihty0ps815sGRpjvnURwWjSBMgPRzVct6tMkyN3zZgZsGwbTR.eN3ji6i.hfFSOCh1";
     extraGroups = [ "wheel" "docker" ]; 
     openssh.authorizedKeys.keys = [ (lib.mkIf (pubKeys ? ${config.networking.hostName}) pubKeys.${config.networking.hostName}) ];  
     packages = with pkgs; [
       vim
       tree
       traceroute
      ];
   };

}