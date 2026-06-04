# Homebrew formula for triage — install with:
#   brew install inkless/triage/triage
#
# Builds from the published crates.io source crate (`triage-tui`), so build.rs
# compiles the Swift notify helper on the user's own mac — no Developer ID
# signing / notarization needed, and click-to-jump notifications work out of
# the box. The helper is installed under prefix/scripts/triage-notify/ to match
# triage's runtime probe (`<exe_dir>/../scripts/triage-notify/triage-notify.app`).
#
# The crate is named `triage-tui` (the name `triage` was taken on crates.io);
# the installed binary is `triage` via the crate's [[bin]] section.
class Triage < Formula
  desc "TUI to monitor parallel Claude Code and Codex CLI sessions across tmux panes"
  homepage "https://github.com/inkless/triage"
  url "https://static.crates.io/crates/triage-tui/triage-tui-0.2.0.crate"
  version "0.2.0"
  sha256 "c5317e6926fdcafa900ba59433d8ef91f87b6ea26d3bc1c7b44122796b43ca41"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/inkless/triage.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos
  depends_on "tmux"

  def install
    system "cargo", "install", *std_cargo_args
    system "bash", "scripts/triage-notify/build.sh", buildpath/"dist"
    (prefix/"scripts/triage-notify").install buildpath/"dist/triage-notify.app"
  end

  test do
    assert_match "triage", shell_output("#{bin}/triage --help 2>&1")
  end
end
