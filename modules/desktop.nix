{ config, pkgs, ... }: {
  # Display & desktop
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:lalt_lshift_toggle";
  };
  
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Printing & networking
  services.printing.enable = true;
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
}
