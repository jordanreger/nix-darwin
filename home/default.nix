{ pkgs, username, mac-app-util, ... }:

{
  imports = [
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
      deno
      eza
      flyctl
      gh
      glow
      gopls
      #iterm2
      lazygit
      marksman
      neofetch
      plan9port
      ranger
      rustup
      #vscode
      vscode-langservers-extracted
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
      ls = "exa";
      nix-config = "cd ~/.config/nix";
      nix-gc = "nix-store --gc";
      nix-rebuild = "darwin-rebuild switch --flake ~/.config/nix";
    };

    stateVersion = "23.11";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
