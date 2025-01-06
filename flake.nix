{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; }; in {

      packages.default = pkgs.rustPlatform.buildRustPackage {
        pname = "uuidgen7";
        version = "1.0.0";
        nativeBuildInputs = with pkgs; [ cargo rustc ];
        src = ./.;
        cargoHash = "sha256-7EDYbltxdlci5VVJv0+eiSSjZv2iSybksa0Sjz+45VA=";
      };
    });
}
