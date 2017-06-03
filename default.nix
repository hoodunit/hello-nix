{ pkgs ? import ./pkgs.nix }:

{
  hello-haskell = import ./hello-haskell/default.nix {};
  hello-clojure = import ./hello-clojure/default.nix {};
  hello-purescript = import ./hello-purescript/default.nix {};
}
