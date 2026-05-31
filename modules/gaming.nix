{ config, pkgs, pkgsUnstable, ... }: {
  programs.steam.enable = true;
  
  environment.systemPackages = with pkgs; [
    prismlauncher
    lutris
    pkgsUnstable.protonplus
  ];
}
