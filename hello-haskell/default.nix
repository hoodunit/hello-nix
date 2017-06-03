{ pkgs ? import ./pkgs.nix }:

pkgs.haskellPackages.callPackage ./app.nix { }
