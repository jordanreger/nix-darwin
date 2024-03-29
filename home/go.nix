{ ... }: {
  programs.go = {
    enable = true;

    goPath = "./Library/go";
    goBin = "./Library/go/bin";
  };
}
