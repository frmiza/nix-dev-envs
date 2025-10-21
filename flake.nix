{
  description = "Development env system with nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        rustDevShell = import ./envs/rust.nix { inherit pkgs; };
        cppDevShell = import ./envs/cpp.nix { inherit pkgs; };
        haskellDevShell = import ./envs/haskell.nix { inherit pkgs; };
        pythonDevShell = import ./envs/python.nix { inherit pkgs; };

      in {
        devShells = {
          default = pkgs.mkShell {
            name = "multi-lang-env";
            buildInputs = [];
            shellHook = ''
              echo "Use nix develop .#rust | .#cpp | .#haskell | .#python"
            '';
          };

          rust = rustDevShell;
          cpp = cppDevShell;
          haskell = haskellDevShell;
          python = pythonDevShell;
        };
      });
}
