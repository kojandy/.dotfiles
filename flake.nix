{
  description = "flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin }: {
    darwinConfigurations = {
      studio = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ ./hosts/darwin/default.nix ];
      };
    };
  };
}
