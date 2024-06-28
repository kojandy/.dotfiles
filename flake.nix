{
  description = "ohjun's home";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager }:
    let
      inherit (import ./lib { inherit nixpkgs; }) mkHome;
    in {
      darwinConfigurations.studio = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin
          ./hosts/studio.nix

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
    };
}
