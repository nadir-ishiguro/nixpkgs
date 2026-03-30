{
  lib,
  fetchFromGitHub,
  rustPlatform,
  nix-update-script,
  versionCheckHook,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "okapi";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "nk9";
    repo = "okapi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1cfnEhJiCtESp+a7vEANocPgxQVr88FJf3EYLjuaIDI=";
  };

  cargoHash = "sha256-+vb0ju5FUOWAUTysUYh95d0o8fzdaPlfwszGcTUPQzo=";

  passthru.updateScript = nix-update-script { };

  nativeInstallCheckInputs = [ versionCheckHook ];
  doInstallCheck = true;

  meta = {
    description = "Find lines across files by regex and edit them all at once with your $EDITOR";
    homepage = "https://github.com/nk9/okapi";
    changelog = "https://github.com/nk9/okapi/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      nadir-ishiguro
    ];
    mainProgram = "okapi";
    platforms = lib.platforms.all;
  };
})
