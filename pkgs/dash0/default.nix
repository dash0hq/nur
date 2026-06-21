# Placeholder package definition.
#
# GoReleaser overwrites this file on every dash0-cli release (see the `nix`
# block in dash0-cli's .goreleaser.yaml) with a fetchurl-based derivation that
# installs the released binary. It is committed so the flake is buildable —
# `nix flake check` is green and `nix build .#dash0` succeeds — before any
# release has populated it. Do not edit by hand.
{ runCommand }:

runCommand "dash0"
  {
    meta.mainProgram = "dash0";
  }
  ''
    mkdir -p "$out/bin"
    cat > "$out/bin/dash0" <<'EOF'
    #!/bin/sh
    echo "dash0: no release has been published to this Nix User Repository yet." >&2
    echo "See https://github.com/dash0hq/dash0-cli for other install options." >&2
    exit 1
    EOF
    chmod +x "$out/bin/dash0"
  ''
