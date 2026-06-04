# homebrew-triage

Homebrew tap for [**triage**](https://github.com/inkless/triage) — a TUI to
triage parallel Claude Code & Codex CLI sessions across tmux panes, sorted by
attention priority.

## Install

```sh
brew install inkless/triage/triage
```

That's shorthand for:

```sh
brew tap inkless/triage
brew install triage
```

Upgrade with `brew upgrade triage`; remove with `brew uninstall triage`.

## Requirements

- macOS
- tmux (installed automatically as a dependency)

## What the formula does

It builds the [`triage-tui`](https://crates.io/crates/triage-tui) crate from
source, so the macOS notification helper compiles on your own machine —
click-to-jump notifications work out of the box, with no code-signing or
notarization hoops. The installed binary is `triage`.

## Links

- Project & docs: <https://github.com/inkless/triage>
- crates.io: <https://crates.io/crates/triage-tui>

---

This tap is maintained automatically: each triage release bumps the formula's
version/url/sha256 here via the project's release workflow.
