cask "localflow" do
  version "0.3.2"
  sha256 "2658f6a914d1885a64e1a9c31138e857703ae0b5c09ecff1c99bb758a8f43986"

  url "https://github.com/brunovskyoliver/local_flow/releases/download/v#{version}/LocalFlow-#{version}-arm64.zip"
  name "LocalFlow"
  desc "Local dictation and meeting transcription"
  homepage "https://github.com/brunovskyoliver/local_flow"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "LocalFlow.app"

  caveats <<~EOS
    LocalFlow is ad-hoc signed, without an Apple Developer ID, and is not notarized.
    On first launch, macOS may block it. If you trust this download:
      1. Open LocalFlow from Applications once, then dismiss the warning.
      2. Open System Settings > Privacy & Security.
      3. Find LocalFlow under Security, click Open Anyway, and confirm.
    Keep Gatekeeper enabled. Managed Macs may not allow this exception.

    In-app updates are disabled; use Homebrew to install new versions.
    After updates, macOS may require approval again. If shortcuts or insertion
    stop working, remove and re-add LocalFlow in Input Monitoring and
    Accessibility, then restart it. Grant Microphone access when prompted.
    Model downloads are handled inside the app, separately from Homebrew.
    Quit LocalFlow before upgrading or uninstalling. Recordings, models and
    settings in Application Support are preserved when the app is uninstalled.
  EOS
end
