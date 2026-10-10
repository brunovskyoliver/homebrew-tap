cask "vole" do
  version "0.1.1"
  sha256 "a52eba4fb535b079434ed411d40b697c2ad34bebb23a5bfe1cfff51a9a9e836a"

  url "https://github.com/brunovskyoliver/vole/releases/download/v#{version}/Vole-#{version}-arm64.zip"
  name "Vole"
  desc "Workbench for assembling, compiling and stepping through machine code"
  homepage "https://github.com/brunovskyoliver/vole"

  depends_on arch: :arm64
  # The bundled assembler, linker and C compiler launchers call these.
  depends_on formula: "lld"
  depends_on formula: "llvm"
  depends_on macos: :ventura

  app "Vole.app"
  binary "#{appdir}/Vole.app/Contents/MacOS/vole-cli"

  # Ad-hoc signed, not notarized: macOS kills quarantined copies of vole-cli
  # outright, so drop the flag on this self-published build.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Vole.app"]
  end

  caveats <<~EOS
    Vole is ad-hoc signed and not notarized. The cask clears its quarantine flag
    so the app and vole-cli start without a Gatekeeper prompt.
  EOS
end
