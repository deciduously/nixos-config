{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    . /home/deciduously/nixos-config/home/bash/bashrc
  '';
    shellAliases = {
      ls = "exa";
      top = "htop";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      enableFlakes = true;
    };
  };
}
