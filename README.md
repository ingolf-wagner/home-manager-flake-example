# Home Manager setup


## Dependencies

- install [nix](https://nixos.org/download/#download-nix)


## How to apply HomeManger configuration

```shell
nix develop                                       # only need to be done the first time
home-manager switch --flake .                     # will find the homeConfiguration.<your-username>
home-manager switch --flake .#<not-your-username> # will install the home of another user (might not work because of permissions)
```