
{ inputs, pkgs, ... }:
import ../home {
  username = "deciduously";
  git = {
    name = "Ben Lovy";
    email = "ben@deciduously.com";
  };
  accounts = {
    personal = {
      name = "Ben Lovy";
      email = "ben@deciduously.com";
    };
    work = {
      name = "Ben Lovy";
      email = "ben@deciduously.com";
    };
  };
} {
  inherit pkgs;
}
