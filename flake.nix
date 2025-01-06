{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; }; in {

      packages.default = pkgs.rustPlatform.buildRustPackage {
        pname = "uuidgen";
        version = "1.0.0";
        nativeBuildInputs = with pkgs; [ cargo rustc ];
        src = ./.;
        cargoHash = "sha256-wWpQ1oDRkq1E316Msfs1xK47bqYSv2cOUNMi1Rqjt/E=";
      };
    });
}
