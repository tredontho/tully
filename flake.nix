{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        haskellPackages = pkgs.haskellPackages;
      in {
        devShell = pkgs.mkShell {
	  buildInputs = with haskellPackages; [
	    haskell-language-server
	    ghc
	    ghcid
	    cabal-install
	    hlint
	    fourmolu
	  ];
        };
      });
}
