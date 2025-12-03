# Home Manager setup

## Links

- [Nix Packages](https://search.nixos.org/packages)
- [HomeManager Options](https://home-manager-options.extranix.com/)
- [Stylix](https://github.com/nix-community/stylix)

## Dependencies

- install [nix](https://nixos.org/download/#download-nix)
- enable [nix flakes](https://wiki.nixos.org/wiki/Flakes#Setup)

## How to get bootstrap

- In [flake.nix](./flake.nix) there is a `homeConfigurations.example` rename it
  to `homeConfigurations.<your-username>` as well as the `home.username` and the
  `home.directory`.
- Also rename the `./homes/example` folder to `./homes/<your-username>` and make
  sure in `homeConfigurations.<your-username>` you include this folder instead
  of `./home/example`

## How to apply HomeManger configuration

```shell
nix develop                                       # only need to be done the first time
home-manager switch --flake .                     # will find the homeConfiguration.<your-username>
home-manager switch --flake .#<not-your-username> # will install the home of another user (might not work because of permissions)
```

## How to format

```shell
nix fmt # will run treefmt
```

## How to update

```shell
nix flake upate # will update all inputs in flake.nix (flake.lock)
```
