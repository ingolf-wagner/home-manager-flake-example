{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with types;
{

  options.backup = {
    dirs = mkOption {
      type = listOf str;
      default = [ ];
      description = ''
        List of all folders that should be backed up.
        Path is a String and must be the full path.
      '';
      example = [
        "/home/palo/.ssh"
        "/home/palo/.gnupg"
      ];
    };
    configurations = mkOption {
      type = listOf str;
      default = [ ];
      description = ''
        Add your backup system here, which takes care of backuping files in `backup.dir`.
      '';
      example = [
        "restic"
        "borgbackup"
      ];
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.backup.dirs != [ ]) {
      home.file."backup.info".text =
        let
          backupList = concatStringsSep "\n" (map (path: "- ${path}") (sort lessThan config.backup.dirs));
          configurationsList = concatStringsSep "\n" (
            map (backupSystem: "- ${backupSystem}") config.backup.configurations
          );

          emptyHeader = ''
            Backup is not configured yet, these folders need
            to be backed up if you set one up.'';

          fullHeader = ''
            Backup is configured with
            ${configurationsList}

            These are the folders which are backuped up'';

          header = if (config.backup.configurations == [ ]) then emptyHeader else fullHeader;
        in
        ''
          ${header}
          ${backupList}
        '';
    })
  ];
}
