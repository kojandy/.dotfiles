{
  description = "ohjun's home";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-droid.url = "github:NixOS/nixpkgs/88d3861";
    home-manager-droid = {
      url = "github:nix-community/home-manager/c909892";
      inputs.nixpkgs.follows = "nixpkgs-droid";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs-droid";
        home-manager.follows = "home-manager-droid";
      };
    };

    paneru = {
      url = "github:karinushka/paneru";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, nix-on-droid, nixpkgs-droid, ... }@inputs: {
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
      pkgs = import nixpkgs-droid { system = "aarch64-linux"; };
      modules = [ ./modules/nix-on-droid.nix ];
      extraSpecialArgs.inputs = inputs;
    };
  };
}
