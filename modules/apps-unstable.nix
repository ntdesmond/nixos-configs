{ config, pkgsUnstable, ... }: {
  environment.systemPackages = with pkgsUnstable; [
    telegram-desktop
    # discord
  ];
}
