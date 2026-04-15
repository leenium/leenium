# Leenium Installer

The Leenium installer is the post-`archinstall` layer that turns a base Arch system into a configured Leenium machine.

It is not a generic Linux installer. This repo is the opinionated system payload: packages, defaults, UI, shell tooling, theming, desktop integration, hardware tweaks, and first-run behavior.

The public project site lives at [leenium.org](https://leenium.org).

Leenium is a fork of [Omarchy](https://github.com/basecamp/omarchy).

## What This Repo Contains

The installer is split into a few clear areas:

- `install/`: staged install pipeline
- `bin/`: user-facing commands and menu actions
- `default/`: default configs and shell assets copied into the target system
- `config/`: application and desktop config payloads
- `themes/`: built-in theme packs
- `applications/`: desktop entries and icons

The main entrypoint is [`install.sh`](./install.sh). It runs the installer in this order:

1. `preflight`
2. `packaging`
3. `config`
4. `login`
5. `post-install`

## Install Flow

At a high level, the installer does the following:

1. Validates the environment and prepares the install context.
2. Installs the Leenium package set and hardware-specific packages.
3. Applies Leenium defaults, configs, themes, shell functions, and helper scripts.
4. Configures login/session pieces such as SDDM, Plymouth, and related boot behavior.
5. Finishes with post-install tasks and first-run preparation.

The resulting system includes:

- Hyprland-centered desktop configuration
- Leenium menu and launcher tooling
- Themed Waybar, Walker, terminal, editor, and shell defaults
- Package management helpers
- Theme, font, and background switching commands
- Wi-Fi, Bluetooth, audio, screenshot, screen recording, and sharing helpers
- Hardware compatibility fixes for a range of devices

## Repo Layout

### `install/`

This is the staged installer pipeline.

- `preflight/`: environment checks, logging setup, migration execution, and install guards
- `packaging/`: package selection and installation, including hardware-specific additions
- `config/`: configuration copy/install plus system tweaks and rules
- `login/`: display manager, Plymouth, boot/login integration
- `post-install/`: finalization and reboot-ready cleanup
- `first-run/`: tasks deferred until the first user session
- `helpers/`: shared logging, chroot, presentation, and error helpers

### `bin/`

This repo exposes a large command surface for daily use and system maintenance. Examples include:

- `leenium-menu`
- `leenium-launch-wifi`
- `leenium-launch-bluetooth`
- `leenium-theme-set`
- `leenium-pkg-add`
- `leenium-refresh-*`
- `leenium-install-*`
- `leenium-restart-*`

These commands are part of the installed Leenium environment, not just development tooling.

### `default/` and `config/`

These directories hold the shipped defaults for:

- Bash and shell functions
- Hyprland and related session components
- Walker, Waybar, terminals, editors, notifications, and desktop utilities
- Browser, theme, font, and branding defaults

### `themes/`

Theme packs live here and drive Leenium’s appearance across the system.

## Development Notes

The installer repo is intended to be used as the payload source for the Leenium ISO and for iterative system development.

Common development patterns:

- Edit files in `default/`, `config/`, `bin/`, or `themes/`
- Re-run install or refresh commands on a test machine
- Treat `1.0.0` as the new baseline
- Add new migrations only for changes introduced after `1.0.0`

## Relationship to the ISO Repo

This repo does not build the bootable image by itself.

The bootable installer image is built by the companion ISO repo at [github.com/leenium/iso](https://github.com/leenium/iso), which pulls this installer repo into the ArchISO build flow. The ISO gets a machine to a base Arch install state, then this repo applies the Leenium system layer.

## License

Leenium is released under the [MIT License](./LICENSE).
