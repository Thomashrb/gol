{ mkDerivation, cabal-install, apply-refact, base, hlint, stdenv
}:
mkDerivation {
  pname = "code";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    cabal-install apply-refact base hlint
  ];
  license = stdenv.lib.licenses.bsd3;
}
