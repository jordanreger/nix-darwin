{ pkgs, username, mac-app-util, ... }:

{
  imports = [
    mac-app-util.homeManagerModules.default
    #./alacritty.nix
    ./git.nix
    ./go.nix
    ./helix.nix
    ./zsh.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # packages without their own file
    packages = with pkgs; [
      delve
      eza
      lazygit
      glow
      gh
      gopls
      iterm2
      ranger
      zellij
    ];

    sessionVariables = {
      EDITOR = "hx";
    };

    shellAliases = {
      lg = "lazygit";
      ls = "exa --icons";
      nix-config = "cd ~/.config/nix";
      nix-gc = "nix-store --gc";
      nix-rebuild = "darwin-rebuild switch --flake ~/.config/nix";
    };

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
