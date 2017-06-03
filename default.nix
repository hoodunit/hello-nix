{ pkgs ? import ./pkgs.nix }:

{
  hello-clojure = import ./hello-clojure/default.nix {};
  hello-haskell = import ./hello-haskell/default.nix {};
  hello-java = import ./hello-java/default.nix {};
  hello-purescript = import ./hello-purescript/default.nix {};
}
