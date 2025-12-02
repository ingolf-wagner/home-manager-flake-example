{ pkgs, ... }:
{
  imports = [
    ./stylix.nix
    ./backup.nix
  ];

  home.packages = [
    pkgs.home-manager # we need home-manager
  ];
}
