{ pkgs ? import ./pkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "hello-purescript";
  src = ./.;
  buildInputs = [
    pkgs.purescript
    pkgs.nodejs-7_x
    pkgs.nodePackages.bower
    pkgs.git
  ];
  buildPhase = ''
    HOME=. npm install
    export SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt
    HOME=. bower update --force-latest
    npm run build
  '';
  checkPhase = ''
    npm run test
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp -r output/hello.js node_modules $out/
    echo "#!${pkgs.bash}/bin/bash" > $out/bin/hello-purescript
    echo "${pkgs.nodejs}/bin/node $out/hello.js" >> $out/bin/hello-purescript
    chmod +x $out/bin/hello-purescript
  '';
}