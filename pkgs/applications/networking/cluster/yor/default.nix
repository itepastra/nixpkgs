{ buildGoModule
, fetchFromGitHub
, lib
}:

buildGoModule rec {
  pname = "yor";
  version = "0.1.196";

  src = fetchFromGitHub {
    owner = "bridgecrewio";
    repo = pname;
    rev = version;
    hash = "sha256-3jM5UaI8kmcW4z9YU7GJKHCNoX10BpO10C47/b/1I74=";
  };

  vendorHash = "sha256-uT/jGD4hDVes4h+mlSIT2p+C9TjxnUWsmKv9haPjjLc=";

  doCheck = false;

  # https://github.com/bridgecrewio/yor/blob/main/set-version.sh
  preBuild = ''
    cat << EOF > src/common/version.go
    package common

    const Version = "${version}"
    EOF
  '';

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Extensible auto-tagger for your IaC files. The ultimate way to link entities in the cloud back to the codified resource which created it";
    homepage = "https://github.com/bridgecrewio/yor";
    changelog = "https://github.com/bridgecrewio/yor/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = [ maintainers.ivankovnatsky ];
  };
}
