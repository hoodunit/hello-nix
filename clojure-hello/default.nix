{ pkgs ? import ./pkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "clojure-hello";
  src = ./.;
  buildInputs = [
    pkgs.leiningen
    pkgs.openjdk
  ];
  buildPhase = ''
    lein uberjar
  '';
  checkPhase = ''
    lein test
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp -r target/uberjar/clojure-hello-0.1.0-SNAPSHOT-standalone.jar $out/hello-clojure.jar
    echo "#!${pkgs.bash}/bin/bash" > $out/bin/hello-clojure
    echo "${pkgs.openjdk}/bin/java -jar $out/hello-clojure.jar" >> $out/bin/hello-clojure
    chmod +x $out/bin/hello-clojure
  '';
}