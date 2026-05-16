{
  description = "base config idk";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager.url = "github:nix-community/home-manager/release-25.11";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }: {
    nixosConfigurations.kittenbox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        # Pass unstable pkgs to modules that need them
        pkgsUnstable = import nixpkgs-unstable { 
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [
        ./hosts/kittenbox/default.nix
        ./modules/base.nix
        ./modules/desktop.nix
        ./modules/apps-stable.nix
        ./modules/apps-unstable.nix
        ./modules/dev.nix
        ./modules/2d.nix
        ./modules/3d.nix
        ./modules/gaming.nix
        ./modules/virt.nix
      ];
    };
  };
}
