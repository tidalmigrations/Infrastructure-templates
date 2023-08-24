{ self, pkgs, tidal-tools, ... }: {
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      trusted-users = [ "root" "tidal" ];
      auto-optimise-store = true;
    };
  };

  networking.hostName = "Nix"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  users.users.tidal = {
    isNormalUser = true;
    password = "tidal";
    extraGroups = [ "networkmanager" "wheel" "video" "kvm" ];
  };

  environment = {
    systemPackages = with pkgs; [
      tidal-tools.packages.x86_64-linux.default
      docker
      python311
      python311Packages.pip
      nmap
      jq
    ];
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.dbus.enable = true;
  virtualisation.docker.enable = true;
}
