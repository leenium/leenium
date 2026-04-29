# Contributing to Leenium

Leenium is a community Linux desktop built on Arch. Inspired by [Omarchy](https://github.com/basecamp/omarchy), but with its own identity and direction. Contributions of all kinds are welcome — themes, commands, config improvements, hardware support, bug fixes, and new features.

## Ways to Contribute

| Area | Where | Skill needed |
|------|-------|-------------|
| Themes | `themes/` | Color theory, Hyprland/Waybar/terminal config |
| Commands | `bin/` | Bash |
| Desktop config | `config/`, `default/` | Hyprland, app config |
| Install pipeline | `install/` | Bash, Arch packaging |
| Hardware support | `install/packaging/` | Arch/Linux hardware knowledge |
| Bug reports | GitHub Issues | — |
| Package requests | GitHub Issues | — |

## Dev Setup

You need a running Leenium install (or base Arch + Hyprland) to test changes.

Clone your fork:

```bash
git clone https://github.com/<you>/leenium
cd leenium
```

Test changes by running individual install stages or refreshing configs directly. For installer changes, test on a spare machine or VM.

For ISO changes, use the companion [iso repo](https://github.com/leenium/iso):

```bash
make build-local LEENIUM_PATH=/path/to/your/leenium
```

## Branch Rules

This repo uses named branches by change type:

| Branch | Use for |
|--------|---------|
| `feature` | New commands, new functionality |
| `fix` | Bug fixes |
| `theme` | New or updated themes |
| `config` | Config/default changes |
| `chore` | Cleanup, deps, build changes |

Work on the appropriate branch, then open a PR into `dev`. `master` is the stable release branch.

## Adding a Theme

Themes live in `themes/<name>/`. Each theme is a directory with config files that override defaults across the desktop stack (Hyprland colors, Waybar, terminal, walker, etc.).

Look at an existing theme like `themes/tokyo-night/` for structure. Your theme should set:

- Hyprland border/background colors
- Waybar colors and style
- Terminal color scheme
- Walker colors
- Wallpaper (or wallpaper reference)

Submit via PR on the `theme` branch. Include a screenshot in the PR description.

## Adding a `bin/` Command

Commands in `bin/` are shell scripts installed into the user's `PATH` as part of Leenium. Follow these conventions:

- Name: `leenium-<verb>-<noun>` (e.g. `leenium-launch-wifi`)
- Shebang: `#!/usr/bin/env bash`
- No unnecessary dependencies — prefer tools already in the Leenium package set
- Exit non-zero on failure

## Requesting a Package

The Leenium package repo is maintainer-managed. To request a package be added:

1. Open a GitHub Issue with the label `package-request`
2. Include the AUR package name and why it belongs in Leenium defaults

The maintainer will evaluate and add it if it fits.

## Pull Request Guidelines

- One concern per PR — don't mix theme + bin command + config fix
- Test your changes on a real install before submitting
- Include a short description of what changed and why
- Screenshots for visual changes (themes, waybar, etc.)
- PRs go into `dev`, not `master`

## Bug Reports

Use the [Bug template](https://github.com/leenium/leenium/issues/new?template=bug.yml). Include output of `leenium-debug` when relevant.

Support questions go to [Discussions](https://github.com/leenium/leenium/discussions) — not Issues.

## License

Contributions are accepted under the [MIT License](./LICENSE).
