{
  lib,
  # stdenv,
  buildGoModule,
  fetchFromGitHub,
  # installShellFiles,
  versionCheckHook,
  nix-update-script,
}:

buildGoModule rec {
  pname = "wifitui";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "shazow";
    repo = "wifitui";
    tag = "v${version}";
    hash = "sha256-MC83hjeCxoP6xp0BfC7gsYZcGzgckWLpxAuXyuhWpn0=";
  };

  vendorHash = "sha256-SEQPc13cefzT8SyuD3UmNtTDgcrXUGTX54SBrnOHJJw=";

  # nativeBuildInputs = [ installShellFiles ];
  #
  # postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
  #   installShellCompletion --cmd gocatcli \
  #     --bash <($out/bin/gocatcli completion bash) \
  #     --fish <($out/bin/gocatcli completion fish) \
  #     --zsh <($out/bin/gocatcli completion zsh)
  # '';

  nativeCheckInputs = [ versionCheckHook ];
  doCheck = true;

  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://github.com/shazow/wifitui/";
    changelog = "https://github.com/shazow/wifitui/releases/tag/v${version}";
    description = "Fast featureful friendly wifi terminal UI";
    longDescription = '''';
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      nadir-ishiguro
    ];
    mainProgram = "wifitui";
  };
}
