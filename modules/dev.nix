{ config, pkgs, ... }: {
  programs.git.enable = true;
  programs.bat.enable = true;
  programs.htop.enable = true;
  
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "docker" "z" ];
      theme = "amuse";
    };
    shellAliases = { cat = "bat"; };
  };
  
  environment.systemPackages = with pkgs; [
    micro
    fastfetch
    zip
    unzip
    nftables
    nix-search-cli
  ];
}
