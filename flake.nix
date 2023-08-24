{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tidal-tools = {
      url = "git+ssh://git@github.com/tidalmigrations/tidal-tools?ref=main&rev=34550d4abc304c1428465ab09b0f558c075f1c35";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixos-generators, tidal-tools, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux = {
        hyperv = nixos-generators.nixosGenerate {
          specialArgs = {
            tidal-tools = tidal-tools;
          };
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
          format = "hyperv";
        };
        azure = nixos-generators.nixosGenerate {
          specialArgs = {
            tidal-tools = tidal-tools;
          };
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
          format = "azure";
        };
        vbox = nixos-generators.nixosGenerate {
          system = "
        x86_64-linux ";
          modules = [
            # you can include your own nixos configuration here, i.e.
            ./configuration.nix
          ];
          format = "virtualbox";
        };

        # hack stolen from
        # https://github.com/nix-community/nixos-generators/issues/128#issuecomment-1484084499
        vmware =
          let
            base = nixos-generators.nixosGenerate {
              system = "x86_64-linux";
              modules = [
                # you can include your own nixos configuration here, i.e.
                ./configuration.nix
                ./vmware.nix
              ];
              format = "virtualbox";
            };
            vmx = "vmx-20";
          in
          pkgs.runCommand "vbox"
            { } ''
            ova=${base}/*.ova
            mkdir $out
            # cp $ova "$out/unfixed.ova"  # debug
            ${pkgs.cot}/bin/cot --force --verbose edit-product $ova -p 'Some Info' -o nixos.ova
            ${pkgs.cot}/bin/cot --force --verbose edit-hardware nixos.ova -v ${vmx}
            tar xf nixos.ova
            sed -i -E 's/^(\s*<(ovf:)?ProductSection)>\s*$/\1 ovf:required="false">/' *.ovf
            sed -i -E "s/^(SHA1\(nixos.ovf\)=\s*).*$/\1$(sha1sum nixos.ovf | cut -d ' ' -f 1)/" *.mf
            ${pkgs.ovftool}/bin/ovftool --lax --sourceType=OVF --targetType=OVA nixos.ovf $out/nixos.ova
            # tar cf $out/nixos.ova *.ovf *.mf *.vmdk
          '';

        qemu = nixos-generators.nixosGenerate {
          system = "x86_64-linux";
          modules = [
            # you can include your own nixos configuration here, i.e.
            ./configuration.nix
          ];
          format = "vm";
          specialArgs = {
            tidal-tools = tidal-tools;
          };
        };
      };
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [ pkgs.qemu pkgs.virtualbox pkgs.vmware-workstation pkgs.ovftool pkgs.cot ];
      };
    };
}
