# Rahat Sagor's Homebrew tap

Homebrew formulae and casks for apps by [Rahat Sagor](https://github.com/rahatsagor).
Each app has its own formula or cask, download source, and version.

## Available apps

| App | What it does | Install | Requirements |
| --- | --- | --- | --- |
| [CmdPalm](https://cmdpalm.app) | Use your phone as a trackpad, keyboard, and button deck for your Mac | `brew install --cask rahatsagor/tap/cmdpalm` | Apple Silicon, macOS 15 or later |
| [Termbelt](https://termbelt.rsapplication.com) | 21 developer tools in one terminal: speed, DNS, TLS, WHOIS, domains, ports, JSON, JWT and more | `brew install rahatsagor/tap/termbelt` | macOS or Linux, x64 or ARM64 |

## Install CmdPalm

```sh
brew install --cask rahatsagor/tap/cmdpalm
```

[Source code](https://github.com/rahatsagor/CmdPalm) · [Downloads and release notes](https://github.com/rahatsagor/CmdPalm/releases)

CmdPalm is self-signed and is not notarized by Apple. Its cask removes quarantine
from the installed CmdPalm app bundle. Allow Accessibility access in System
Settings when CmdPalm asks for it.

## Install Termbelt

```sh
brew install rahatsagor/tap/termbelt
```

[Source code](https://github.com/rahatsagor/termbelt) · [Downloads and release notes](https://github.com/rahatsagor/termbelt/releases)

The formula installs the prebuilt, checksum-verified binary from the GitHub
release, plus bash, zsh and fish completions. Update with `brew upgrade termbelt`.

## Releases

Each app's release workflow updates its own file automatically: CmdPalm's
updates `Casks/cmdpalm.rb` and Termbelt's updates `Formula/termbelt.rb`. Apps are
released independently, and new apps are listed above as they are published.
