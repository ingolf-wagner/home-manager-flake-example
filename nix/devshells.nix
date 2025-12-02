{ inputs, ... }:
{

  imports = [ inputs.devshell.flakeModule ];

  perSystem =
    {
      pkgs,
      self',
      system,
      ...
    }:
    {

      # allow unfree packages
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      devshells.default = {

        commands = [
          {
            help = "example command";
            name = "example";
            command = "echo 'this is an example command'";
          }
        ];

        packages = [
          pkgs.home-manager # we need home-manager
        ];
      };
    };
}
