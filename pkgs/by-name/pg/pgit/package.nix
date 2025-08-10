{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "pgit";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "picosh";
    repo = "pgit";
    tag = "v${finalAttrs.version}";
    hash = "sha256-81ZiaY973+mGnYbDX+6fhe9NTYjQhWsvdpW0v42pasw=";
  };

  vendorHash = "sha256-in8GVcOlGsvmcbegJmYwvE0AVJhVJ83x1v3ymV0uTpg=";

  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://github.com/picosh/pgit";
    changelog = "https://github.com/picosh/pgit/releases/tag/v${finalAttrs.version}";
    description = "Static site generator for git repos";
    platforms = lib.platforms.unix;
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      nadir-ishiguro
    ];
    mainProgram = "pgit";
  };
})
