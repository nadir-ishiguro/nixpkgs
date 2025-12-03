{
  lib,
  buildGoModule,
  fetchFromGitHub,
  # versionCheckHook,
  nix-update-script,
}:

buildGoModule rec {
  pname = "gitmal";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "antonmedv";
    repo = "gitmal";
    tag = "v${version}";
    hash = "sha256-laQYZ+7TA/PwtvUfHHGW6i/58iedRW63IzW12j8+9WA=";
  };

  vendorHash = "sha256-LQBG6RPjefq6dFMcSkbRKJTxvHJVYeK9/VQxgYxCDmQ=";

  # nativeCheckInputs = [ versionCheckHook ];
  # doCheck = true;
  #
  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://github.com/antonmedv/gitmal";
    changelog = "https://github.com/antonmedv/gitmal/releases/tag/v${version}";
    description = "Static page generator for repos ";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      nadir-ishiguro
    ];
    mainProgram = "gitmal";
  };
}
