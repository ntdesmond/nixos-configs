{ config, pkgs, ... }: {
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    firefox
  ];
}
