{
  description = "Description for the project";

  inputs = {
    devshell.url = "github:numtide/devshell";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    nixgl.url = "github:nix-community/nixGL";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix/release-25.11";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    let
      meta = rec {
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [
              "electron-24.8.6" # for bitwarden
              "electron-28.3.3" # for logseq
            ];
          };
          overlays = [ inputs.nixgl.overlay ];
        };
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./nix/formatter.nix
        ./nix/devshells.nix
      ];
      systems = [ "x86_64-linux" ];
      flake = {
        homeConfigurations.example = inputs.home-manager.lib.homeManagerConfiguration {
          inherit (meta) pkgs;
          extraSpecialArgs = {
            assets = ./assets;
            inherit inputs;
          };
          modules = [
            inputs.stylix.homeModules.stylix
            ./homes/example
          ];

        };
      };
    };
}
