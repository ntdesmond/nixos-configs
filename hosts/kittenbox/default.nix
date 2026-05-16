{ config, pkgs, ... }: {
  imports = [ ./hardware.nix ];

  networking.hostName = "kittenbox";
  time.timeZone = "Europe/Moscow";
  
  # Boot & storage (machine-specific)
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs3" ];

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/fa811de1-afca-439b-8754-bba96020f040";
    fsType = "ext4";
    options = [ "users" "nofail" ];
  };

  fileSystems."/mnt/win" = {
    device = "/dev/disk/by-uuid/8074015974015378";
    fsType = "ntfs3";
    options = [
      "nofail"
      "uid=1001"
      "gid=100"
      "umask=022"
      "ro"
      "users"
    ];
  };
      
  # Auto-login for this machine only
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "admin";
}
