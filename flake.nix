{
  description = "NixOS VM config with separate dev and pentest accounts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # pentest's home runs on unstable for newer tools; user and the system stay on stable.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, home-manager-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgsFrom = np: import np {
        inherit system;
        config.allowUnfree = true;
      };

      # Standalone home-manager: each account applies its own home with
      # `hms` (home-manager switch, no sudo), so pentest can manage its own
      # packages and dotfiles without being in wheel.
      homeFor = hm: np: name: hm.lib.homeManagerConfiguration {
        pkgs = pkgsFrom np;
        modules = [
          ./common/home.nix
          ./users/${name}/home.nix
          {
            home.username = name;
            home.homeDirectory = "/home/${name}";
          }
        ];
      };
    in
    {
      # Applied by `nrs` as root. This must never import anything under
      # users/pentest: pentest can write there, and root evaluating it would
      # hand pentest root.
      nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
        inherit system;
        # Where the checkout lives; system/configuration.nix and aliases.nix use it.
        specialArgs.flakeDir = "/srv/nixos-vm-config";
        modules = [
          ./system/configuration.nix
          ./system/aliases.nix
          ./system/pentest.nix

          # The home-manager CLI from the same pinned input the homes are
          # built with, so `hms` works on a fresh install.
          { environment.systemPackages = [ home-manager.packages.${system}.home-manager ]; }
        ];
      };

      # 'homeFor' is given values here 
      homeConfigurations = {
           #  'homeFor'   'hm'       'np'   'name'
        user = homeFor home-manager nixpkgs "user";
        pentest = homeFor home-manager-unstable nixpkgs-unstable "pentest";
      };
    };
}
