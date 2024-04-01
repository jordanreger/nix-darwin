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
      gh
      glow
      gopls
      iterm2
      lazygit
      ranger
      rustup
      zellij
    ];

    sessionVariables = {
      EDITOR = "hx";
    };

    sessionPath = [
      "$GOBIN"
    ];

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
