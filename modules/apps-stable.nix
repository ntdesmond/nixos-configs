{ config, pkgs, ... }: {
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    firefox
  ];
}
