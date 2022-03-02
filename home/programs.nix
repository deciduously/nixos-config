{ inputs, pkgs, system, ... }: {
  home.packages = with pkgs; [
    #aerc
    awscli2
    binutils
    bitwarden
    chromium
    cmake
    cowsay
    deno
    discord
    dnsutils
    elixir
    exa
    fd
    file
    fortune
    gcc
    gh
    gimp
    gnome.cheese
    gnome3.adwaita-icon-theme
    gnumake
    hexyl
    htop
    hyperfine
    #inputs.status.defaultPackage.${system}
    inputs.tangram.defaultPackage.${system}
    jetbrains.pycharm-community
    jq
    killall
    libreoffice-fresh
    mpv
    msitools
    nodejs-16_x
    nodePackages.http-server
    octaveFull
    okular
    #obs-studio
    #openrgb
		patchelf
    pavucontrol
    pkg-config
    postgresql
    projectlibre
    #pup
    python3
    ripgrep
    rstudio
    sd
    slack
		sqlite
		tmux
    #thunderbird
    tokei
    unzip
    usbutils
    vim
    #wally-cli
    wdisplays
    xar
    xh
		xournalpp
    zig
    zoom-us
  ];
}
