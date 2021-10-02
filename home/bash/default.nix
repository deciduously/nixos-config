{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    . /etc/nixos/home/bash/bashrc
  '';
  };
}
