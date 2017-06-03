{ pkgs ? import ./pkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "hello-java";
  src = ./.;
  buildInputs = [
    pkgs.maven
    pkgs.openjdk
  ];
  buildPhase = ''
    mvn package
  '';
  checkPhase = ''
    mvn test
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp -r target/hello-java-1.0-SNAPSHOT.jar $out/hello-java.jar
    echo "#!${pkgs.bash}/bin/bash" > $out/bin/hello-java
    echo "${pkgs.openjdk}/bin/java -cp $out/hello-java.jar hello.App" >> $out/bin/hello-java
    chmod +x $out/bin/hello-java
  '';
}