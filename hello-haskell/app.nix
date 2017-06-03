{ mkDerivation, base, curl, wget, stdenv }:
mkDerivation {
  pname = "hello-haskell";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = stdenv.lib.licenses.bsd3;
}
