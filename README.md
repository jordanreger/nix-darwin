# jordanreger/nix

This is my Nix configuration, meant mainly for my Darwin systems.

## Installation

1. Download Nix through the [Determinate Systems installer](https://install.determinate.systems)
2. `git clone https://github.com/jordanreger/nix ~/.config/nix`
3. `cd ~/.config/nix; nix build .#darwinConfigurations.Jordans-MacBook-Pro.system`
4. `./result/sw/bin/darwin-rebuild switch --flake .`
