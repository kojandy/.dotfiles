{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin }: {
    darwinConfigurations.studio = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ ./hosts/darwin.nix ./hosts/studio.nix ];
    };
  };
}
