{ pkgs }:

pkgs.mkShell {
  name = "haskell-env";
  buildInputs = with pkgs; [
    ghc 
    cabal-install 
    haskell-language-server
  ];
  shellHook = ''
    echo "λ Haskell development environment up"
  '';
}

