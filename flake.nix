{
  description = "ohjun's home";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-on-droid.url = "github:nix-community/nix-on-droid/release-24.05";
    nix-on-droid.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, nix-on-droid, home-manager }:
    let
      inherit (import ./lib { inherit nixpkgs; }) mkHome;
    in {
      darwinConfigurations.studio = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin
          ./hosts/studio.nix
          ./modules/pinpoint.nix

          home-manager.darwinModules.home-manager (mkHome {
            "kojandy" = {
              file = {
                root = {
                  ".profile" = ./profile;
                  ".zshrc" = ./zsh/zshrc;
                };
                configs = [ "git" "ideavim" "kitty" "lf" "nvim" "tmux" "broot" ];
              };
            };
          })
        ];
      };

      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [ ./modules/nix-on-droid.nix ];
      };
    };
}
