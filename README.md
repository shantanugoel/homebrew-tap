# homebrew-tap

Homebrew formulae and casks for my tools.

```sh
brew tap shantanugoel/tap
```

## Formulae

| Formula | What it is |
|---|---|
| `skillmeister` | Local library of agent skills with one router entry point. [Source](https://github.com/shantanugoel/skillmeister) |

```sh
brew install shantanugoel/tap/skillmeister
```

## Casks

| Cask | What it is |
|---|---|
| `ganit` | Notepad calculator for Mac. [Source](https://github.com/shantanugoel/ganit) |
| `opencraft` | Native application for the VSD StreamDock N4 Pro on macOS. [Source](https://github.com/shantanugoel/OpenCraft) |

```sh
brew install --cask shantanugoel/tap/ganit
brew install --cask shantanugoel/tap/opencraft
```

### Ganit

Ganit needs macOS 14 or later on Apple silicon. The cask installs `Ganit.app`
and links the `ganit` command. Ganit updates itself. `brew upgrade` also works.

The cask points at the signed and notarized disk image on the
[releases page](https://github.com/shantanugoel/ganit/releases) of Ganit. The
release workflow of Ganit updates `Casks/ganit.rb` for each release. Do not
change the file by hand.

The old tap `shantanugoel/ganit` ([homebrew-ganit](https://github.com/shantanugoel/homebrew-ganit))
copies `Casks/ganit.rb` from this repository, so that existing installations
continue to update. Use `shantanugoel/tap` for a new installation.

### OpenCraft

OpenCraft needs a Mac with Apple silicon and macOS 12 or later. The cask
downloads the notarized disk image from the
[releases page](https://github.com/shantanugoel/OpenCraft/releases) of
OpenCraft and puts `OpenCraft.app` in the Applications folder. To update
OpenCraft, type `brew upgrade --cask opencraft`.

Quit the vendor software VSD Craft before you start OpenCraft. The
[user guide](https://github.com/shantanugoel/OpenCraft/blob/main/docs/user/install.md)
gives the full procedure to install, to start, and to remove OpenCraft.

The script `scripts/homebrew-cask.sh` of the OpenCraft repository writes
`Casks/opencraft.rb` for each release. Do not change the file by hand. Report
a problem in the [issues of OpenCraft](https://github.com/shantanugoel/OpenCraft/issues).
