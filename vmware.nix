{ self, pkgs, ... }: {
  virtualbox = {
    # see: https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-image.nix
    memorySize = 4000; # MiB
    params = {
      audio = "none";
      audioout = "off";
    };
  };
  virtualisation.vmware.guest.enable = true;
}
