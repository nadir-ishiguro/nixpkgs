{
  lib,
  fetchFromGitHub,
  rustPlatform,
  # installShellFiles,
  versionCheckHook,
}:

rustPlatform.buildRustPackage rec {
  pname = "somo";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "theopfr";
    repo = "somo";
    tag = "v${version}";
    hash = "sha256-MPeUR2a3TQUowFd0TadvGz0f1MwWB2tc047F9Ricp0I=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-uYC0GOnzo8nQ8uo7CP3snBnoSOHPE7iYcC6HLUM4SiE=";

  nativeBuildInputs = [
    # installShellFiles
    versionCheckHook
  ];

  # doInstallCheck = true;

  # # 10 passed; 47 failed https://hydra.nixos.org/build/148943783/nixlog/1
  # doCheck = !stdenv.hostPlatform.isDarwin;

  # preConfigure = ''
  #   export BANDWHICH_GEN_DIR=_shell-files
  #   mkdir -p $BANDWHICH_GEN_DIR
  # '';

  # postInstall = ''
  #   installManPage $BANDWHICH_GEN_DIR/bandwhich.1

  #   installShellCompletion $BANDWHICH_GEN_DIR/bandwhich.{bash,fish} \
  #     --zsh $BANDWHICH_GEN_DIR/_bandwhich
  # '';

  meta = {
    description = "Human-friendly alternative to netstat for socket and port monitoring";
    homepage = "https://github.com/theopfr/somo";
    license = lib.licenses.mit;
    changelog = "https://github.com/theopfr/somo/releases/tag/v${version}";
    maintainers = with lib.maintainers; [
      nadir-ishiguro
    ];
    platforms = lib.platforms.linux;
    mainProgram = "bandwhich";
  };
}
