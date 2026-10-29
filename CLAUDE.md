# CLAUDE.md (homebrew-tap)

Homebrew tap for V2Mac: `brew install --cask v2macapp/tap/v2mac`, cask in `Casks/v2mac.rb`.

- The app's release CI (`../app/.github/workflows/release.yml`, `TAP_TOKEN` secret) bumps `version`
  and `sha256` after every release. Don't change them by hand.
- Edit the cask only for install behaviour (postflight, zap, caveats); check with
  `brew audit --cask --strict Casks/v2mac.rb` and `brew style Casks/v2mac.rb`.
- Pushing changes what every user installs: push only when the user asks.
