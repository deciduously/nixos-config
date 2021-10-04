{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    . /etc/nixos/home/bash/bashrc
  '';
  };
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      enableFlakes = true;
    };
  };
}
