
{ inputs, pkgs, ... }:
import ../home {
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
  git = {
    name = "Ben Lovy";
    email = "ben@deciduously.com";
  };
	sshKeyKeygrip = "5FF0A494AD904D11AA7393CFEFBBA934C2DB752E";
  username = "deciduously";
} {
  inherit pkgs;
}
