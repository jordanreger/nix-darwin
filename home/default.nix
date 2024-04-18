{ pkgs, username, ... }:

{
  imports = [
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

      # cmds
      eza
      flyctl
      gh

      # languages
      deno
      rustup

      # LSPs
      gopls
      delve
      marksman
      vscode-langservers-extracted
    ];

    sessionVariables = {
      EDITOR = "hx";
    };

    sessionPath = [
      "$GOBIN"
    ];

    shellAliases = {
      lg = "git status";
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
