{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    . /home/deciduously/nixos-config/home/bash/bashrc
  '';
    shellAliases = {
      ls = "exa";
      top = "htop";
      e = "nvim";
			f = "lf";
      h = "history";
      tree = "exa -T";
      u = "cd ..";
      p = "bat";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
}
