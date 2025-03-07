{
  description = "Jordan Reger's Darwin configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    ...
  }: let
    username = "jordan";
    system = "aarch64-darwin";
    specialArgs =
      inputs
      // {
        inherit username system;
      };
  in {

    # MacOS
    darwinConfigurations = {
      
      "Jordans-MacBook-Pro" = darwin.lib.darwinSystem {
        inherit system specialArgs;

        modules = [
          ./darwin

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = specialArgs;
              useUserPackages = true;
              users.${username} = import ./home;
            };
          }
        ];
      };

    };

    # NixOS

  };
}
