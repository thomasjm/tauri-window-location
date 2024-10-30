{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            atkmm
            libsoup_3
            libsoup_3.dev
            openssl
            openssl.dev
            webkitgtk_4_1
            webkitgtk_4_1.dev

            pkg-config

            rustc
          ];
        };
      }
    );
}
