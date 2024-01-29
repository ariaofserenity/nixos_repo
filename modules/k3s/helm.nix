{config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
      (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-git
        ];
      }) 
    ];
}