{
  imports = [
    ../common
  ];

  home.username = "example";
  home.homeDirectory = "/home/example";
  home.stateVersion = "25.11"; # don't change this. It handles backwards compatibility

  # add backup folders
  backup.dirs = [
    "$HOME/.ssh"
    "$HOME/.gnupg"
  ];
}
