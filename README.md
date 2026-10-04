# homebrew-mdeck

Homebrew tap for [MDeck](https://github.com/allenv0/MDECK) — a native macOS
music player with a retro MiniDisc aesthetic.

## Install

```bash
brew tap allenv0/mdeck
brew trust allenv0/mdeck
brew install --cask mdeck
```

One-liner (no trust step needed — a fully qualified name trusts just this cask):

```bash
brew install --cask allenv0/mdeck/mdeck
```

## First launch

MDeck is ad-hoc signed (not notarized), so Gatekeeper blocks the first launch
with an "unverified developer" warning. Either:

- Right-click `MDECK.app` in Finder → **Open**, or
- `xattr -dr com.apple.quarantine /Applications/MDECK.app`, or
- `brew install --cask --no-quarantine allenv0/mdeck/mdeck`

## Uninstall

```bash
brew uninstall --cask mdeck          # keep user data
brew uninstall --cask --zap mdeck    # also remove playlists, settings, caches
```

## How releases flow

Pushing a tag like `v1.0.0` to `allenv0/MDECK` builds `MDECK.app` in CI and
uploads `MDeck-<version>.zip` (+ `.sha256`) to the GitHub Release. Updating
this tap for a new version is two lines in `Casks/mdeck.rb`: `version` and
`sha256` (copy the latter from the release's `.sha256` asset).
