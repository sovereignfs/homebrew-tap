# Homebrew tap for Fjord

[Homebrew](https://brew.sh) formulae for [Fjord](https://github.com/sovereignfs/fjord),
a way to keep your documents as plain files in a Git repository you control,
with optional end-to-end encryption.

```bash
brew install sovereignfs/tap/fjord
```

That taps this repository (`sovereignfs/homebrew-tap`) and installs `fjord`, the
command-line tool. It works on macOS and on Linux with Homebrew, and installs the
prebuilt binaries from the project's GitHub releases. Nothing is built from source.

## About this repository

The formulae here are **generated**: the release workflow of
[sovereignfs/fjord](https://github.com/sovereignfs/fjord) writes `Formula/fjord.rb`
and pushes it on each CLI release. Do not edit them by hand, because the next
release overwrites them.

Homebrew keeps one version of a formula, so the one here is the latest release.
For anything else, including older versions and other ways to install, see the
[releases page](https://github.com/sovereignfs/fjord/releases).

Report problems with the tool or with installing it at
[sovereignfs/fjord](https://github.com/sovereignfs/fjord/issues).
