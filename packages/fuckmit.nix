{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "fuckmit";
  version = "76ca24cb83be873c2eba2b8fc79667b869e40989";

  src = fetchFromGitHub {
    owner = "mingeme";
    repo = "fuckmit";
    rev = "${version}";
    hash = "sha256-EO0IKjG8Z1GtKTJBK0P0lxQ15IoHodM2tEipubhWpYk=";
  };
  cargoHash = "sha256-Z7cdeDNomdPrSYA/bQur8sQMgw53j7wkaW2KjYWgkco=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs =
    [ openssl ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.SystemConfiguration
    ];

  doCheck = false;

  meta = {
    description = "AI-powered git commit message generator";
    homepage = "https://github.com/mingeme/fuckmit";
    license = lib.licenses.mit;
    mainProgram = "fuckmit";
    maintainers = [ lib.maintainers.mingeme ];
  };

}
