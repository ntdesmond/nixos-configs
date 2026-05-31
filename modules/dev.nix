{ config, pkgs, nix-vscode-extensions, ... }: {
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
    
  environment.systemPackages = with pkgs; let 
    vscode-ext = nix-vscode-extensions.extensions.${system}.vscode-marketplace;
  in [
    micro
    fastfetch
    zip
    unzip
    nftables
    nix-search-cli
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-ext; [
        # Antyos.openscad
        leathong.openscad-language-support
      ];
    })
  ];
}
