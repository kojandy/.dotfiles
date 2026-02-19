{
  description = "ohjun's home";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, nix-on-droid, ... }@inputs: {
    darwinConfigurations.studio = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./modules/darwin
        ./hosts/studio.nix
        ./modules/pinpoint.nix
      ];
      specialArgs.inputs = inputs;
    };


    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs { system = "aarch64-linux"; };
      modules = [ ./modules/nix-on-droid.nix ];
      extraSpecialArgs.inputs = inputs;
    };
  };
}
