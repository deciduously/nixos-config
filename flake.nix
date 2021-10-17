{
  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-wayland  = {
      url = "github:nix-community/nixpkgs-wayland";
    };
    status = {
      url = "path:./status";
    };
    tangram = {
      url = "github:tangramdotdev/tangram/v0.7.0";
    };
  };
  outputs = inputs: {
    nixosConfigurations = {
      shepard = import ./machines/shepard.nix inputs;
    };
  };
}
