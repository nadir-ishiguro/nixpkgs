{
  lib,
  fetchFromGitHub,
  rustPlatform,
  nix-update-script,
  pkg-config,
  alsa-lib,
}:

rustPlatform.buildRustPackage rec {
  pname = "soundscope";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "bananaofhappiness";
    repo = "soundscope";
    rev = version;
    hash = "sha256-H+t6VAEuikQ1NsLb8QMmVknVBjSvCS/hz4U/2gskAX8=";
  };

  cargoHash = "sha256-M22V5plK/1EbyjkaeVoIBqugeC1z8oF9PEK83JwE154=";

  buildInputs = [
    alsa-lib.dev
  ];
  nativeBuildInputs = [
    pkg-config
  ];

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = {
    description = "TUI app for analyzing audio data such as frequencies and loudness (LUFS)";
    homepage = "https://github.com/bananaofhappiness/soundscope";
    changelog = "https://github.com/bananaofhappiness/soundscope/releases/tag/${version}";
    license = with lib.licenses; [
      mit
    ];
    maintainers = with lib.maintainers; [
      nadir-ishiguro
    ];
    mainProgram = "soundscope";
    platforms = lib.platforms.all;
  };
}
