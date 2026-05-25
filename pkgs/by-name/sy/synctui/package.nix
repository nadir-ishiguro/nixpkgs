{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "synctui";
  version = "0-unstable-2026-04-25";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "hertelukas";
    repo = "synctui";
    rev = "1101879bf1d678089b5e5a9ed8e9b0ce2ff3dae2";
    hash = "sha256-gI8nrnpMH09mR5v9nmaKP7nWeUofFvoYP1pSS5Bj+ak=";
  };

  cargoHash = "sha256-ruF98yxxWJOu2FhkZF/JK84N5b2zX7bzg2p79CIPE1s=";

  meta = {
    description = "Configure Syncthing from the terminal";
    homepage = "https://github.com/hertelukas/synctui";
    license = with lib.licenses; [
      asl20
      mit
    ];
    maintainers = with lib.maintainers; [ ];
    mainProgram = "synctui";
  };
})
