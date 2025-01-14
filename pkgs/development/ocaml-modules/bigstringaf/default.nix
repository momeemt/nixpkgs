{
  lib,
  fetchFromGitHub,
  buildDunePackage,
  alcotest,
  pkg-config,
  dune-configurator,
}:

buildDunePackage rec {
  pname = "bigstringaf";
  version = "0.10.0";

  minimalOCamlVersion = "4.08";
  duneVersion = "3";

  src = fetchFromGitHub {
    owner = "inhabitedtype";
    repo = pname;
    rev = version;
    hash = "sha256-p1hdB3ArOd2UX7S6YvXCFbYjEiXdMDmBaC/lFQgua7Q=";
  };

  nativeBuildInputs = [ pkg-config ];
  checkInputs = [
    alcotest
    dune-configurator
  ];
  doCheck = true;

  meta = {
    description = "Bigstring intrinsics and fast blits based on memcpy/memmove";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.vbgl ];
    inherit (src.meta) homepage;
  };
}
