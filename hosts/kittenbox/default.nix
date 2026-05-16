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

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/fa811de1-afca-439b-8754-bba96020f040";
    fsType = "ext4";
    options = [ "users" "nofail" ];
  };
  
  # Auto-login for this machine only
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "admin";
}
