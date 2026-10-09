# Rahat Sagor's Homebrew tap

Homebrew casks for apps by [Rahat Sagor](https://github.com/rahatsagor).
Each app has its own cask, download source, and version.

## Available apps

| App | What it does | Requirements |
| --- | --- | --- |
| [CmdPalm](https://cmdpalm.app) | Use your phone as a trackpad, keyboard, and button deck for your Mac | Apple Silicon, macOS 15 or later |

## Install CmdPalm

```sh
brew install --cask rahatsagor/tap/cmdpalm
```

[Source code](https://github.com/rahatsagor/CmdPalm) · [Downloads and release notes](https://github.com/rahatsagor/CmdPalm/releases)

CmdPalm is self-signed and is not notarized by Apple. Its cask removes quarantine
from the installed CmdPalm app bundle. Allow Accessibility access in System
Settings when CmdPalm asks for it.

## Releases

CmdPalm's release workflow updates `Casks/cmdpalm.rb` automatically.
Additional apps can be added to this tap with their own casks and release
workflows. Each workflow updates its app's cask, and each app is released
independently. Available apps are listed above as they are published.
