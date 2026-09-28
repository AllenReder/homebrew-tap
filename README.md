# AllenReder Homebrew tap

Homebrew formulae and casks maintained by [AllenReder](https://github.com/AllenReder).

## Not Boring Notch

A modern, high-performance notch companion for macOS.

```sh
brew install --cask AllenReder/tap/not-boring-notch
```

The app is ad-hoc signed and not notarized, so macOS Gatekeeper blocks the first
launch after a normal install. Pass `--no-quarantine` to avoid it:

```sh
brew install --cask --no-quarantine AllenReder/tap/not-boring-notch
```

## tmh

Install [tmh](https://github.com/AllenReder/tmh) on macOS or Linux:

```sh
brew install AllenReder/tap/tmh
```

To enable optional Zsh command insertion, add this line to `~/.zshrc`:

```zsh
source "$(brew --prefix)/share/tmh/tmh.zsh"
```

Release binaries and checksums are published by the upstream tmh repository.
