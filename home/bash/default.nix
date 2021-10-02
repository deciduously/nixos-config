{ ... }: {
  programs.bash.enable = true;
  bashrcExtra = ''
    ./bashrc
  '';
}
