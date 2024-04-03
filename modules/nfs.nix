{ pkgs, ...}:

{

    fileSystems."/mnt/common" = {
    device = "192.168.2.14:/mnt/d01/common";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" ];
  };

}