# Dash0 Nix User Repository

Nix packages for [Dash0](https://www.dash0.com) tooling, published as a flake.

This repository is **distribution only** and is generated automatically.

The packages repackage the pre-built release binaries, so installing from here does not compile anything — handy on small machines and in CI.

## Packages

| Package | Description |
|---------|-------------|
| `dash0` | The Dash0 CLI (pre-built release binary, with shell completions) |

Supported systems: `x86_64-linux`, `aarch64-linux`, `x86_64-darwin`, `aarch64-darwin`.

## Install

Requires Nix with flakes enabled.

Run it without installing:

```bash
nix run github:dash0hq/nur#dash0 -- version
```

Install it into your profile:

```bash
nix profile install github:dash0hq/nur#dash0
```

## Use in a flake

```nix
{
  inputs.dash0-nur.url = "github:dash0hq/nur";

  # In a NixOS or Home Manager configuration:
  # environment.systemPackages = [ dash0-nur.packages.${pkgs.stdenv.hostPlatform.system}.dash0 ];
}
```

## Use with the Home Manager module

The CLI's declarative profiles module ships in [`dash0hq/dash0-cli`](https://github.com/dash0hq/dash0-cli#declarative-profiles-with-home-manager).
By default it builds the CLI from source; point `programs.dash0.package` at this repository's pre-built binary to skip compilation:

```nix
{
  inputs.dash0-cli.url = "github:dash0hq/dash0-cli";
  inputs.dash0-nur.url = "github:dash0hq/nur";

  # In your Home Manager configuration:
  # imports = [ dash0-cli.homeManagerModules.default ];
  # programs.dash0 = {
  #   enable = true;
  #   package = dash0-nur.packages.${pkgs.stdenv.hostPlatform.system}.dash0;
  #   # ...profiles...
  # };
}
```

## Maintenance

Do not edit [`pkgs/`](pkgs/) by hand — those files are overwritten on every release by GoReleaser running in [`dash0hq/dash0-cli`](https://github.com/dash0hq/dash0-cli).
The repository always reflects the latest published CLI release.

Only [`flake.nix`](flake.nix) is maintained by hand; it exposes the generated package definitions and the set of supported systems.

## License

[Apache-2.0](LICENSE), matching the Dash0 CLI.
