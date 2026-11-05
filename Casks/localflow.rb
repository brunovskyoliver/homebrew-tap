cask "localflow" do
  version "0.4.5"
  sha256 "f8ec0f1ca784c65d6a16ba4ca1472ed95fc1e590599f11a3befb80779f69350c"

  url "https://github.com/brunovskyoliver/local_flow/releases/download/v#{version}/LocalFlow-#{version}-arm64.zip"
  name "LocalFlow"
  desc "Private dictation and meeting notes, local or on your own server"
  homepage "https://github.com/brunovskyoliver/local_flow"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "LocalFlow.app"

  # The build is signed with a development certificate and not notarized. Clearing the download quarantine lets it open
  # without the "Open Anyway" step; Gatekeeper stays on for everything else.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/LocalFlow.app"],
                          writable_paths: ["LocalFlow.app"], writable_base: :appdir
  end

  uninstall quit: "org.localflow.LocalFlow"

  caveats <<~EOS
    Open LocalFlow from Applications; it lives in the menu bar.
    Setup asks what you want it for:
      - Meeting notes: record calls, get transcripts and notes. No shortcut or
        keyboard permissions.
      - Dictation: hold a key in any app and talk.
      - Both.
    Dictation can be turned on later in Settings.
    Models download inside the app. With a LocalFlow server, paste the token or link
    its owner gives you, and nothing is downloaded.
    Coming from the earlier LocalFlow app? The first launch offers to copy its
    history, meetings, models and settings.
    Updates come through Homebrew: brew upgrade --cask localflow
  EOS
end
