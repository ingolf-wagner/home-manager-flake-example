{
  pkgs,
  lib,
  config,
  assets,
  ...
}:
{

  # my stylix configuration
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
  stylix.image = "${assets}/wallpaper.png";

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.ubuntu;
      name = "Ubuntu";
    };
    sansSerif = {
      package = pkgs.nerd-fonts.ubuntu;
      name = "Ubuntu";
    };
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono";
    };
    emoji = config.stylix.fonts.monospace;
    sizes.popups = 15;
  };

  # disable some flaky stuff
  stylix.targets.hyprpaper.enable = lib.mkForce false;
  stylix.targets.hyprland.enable = lib.mkForce false;
  stylix.targets.swaylock.enable = lib.mkForce false;
  stylix.targets.qt.enable = false;
  stylix.targets.qt.platform = "kde";
  stylix.targets.vim.enable = lib.mkForce false;
  stylix.targets.mako.enable = lib.mkForce false;

}
