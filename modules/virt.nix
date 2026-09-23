{ config, pkgs, ... }: {
  virtualisation.podman = {
  	enable = true;
  	dockerCompat = true;
  	defaultNetwork.settings.dns_enabled = true;
  };

  environment.systemPackages = with pkgs; [
    podman-compose
  ];

  users.users.admin = {
    subUidRanges = [ { startUid = 100000; count = 65536; } ];
    subGidRanges = [ { startGid = 100000; count = 65536; } ];
  
    extraGroups = [
      "podman"
    ];
  };
}
