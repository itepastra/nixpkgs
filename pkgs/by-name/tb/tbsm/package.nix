{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "tbsm";
  version = "0.7";

  src = fetchFromGitHub {
    owner = "loh-tar";
    repo = "tbsm";
    rev = "v${finalAttrs.version}";
    hash = "sha256-wGw/+mZhtB9Z8xYgiH9593aIS8Xg49+yGPinKv3SEnQ=";
  };

  makeFlags = [ "DESTDIR=$(out)" ];

  nativeBuildInputs = [

  ];
  buildInputs = [

  ];

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ itepastra ];
  };
})
