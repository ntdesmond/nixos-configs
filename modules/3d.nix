{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    blender-hip
    openscad-unstable  # or use unstable channel?
    orca-slicer
    f3d
  ];
}
