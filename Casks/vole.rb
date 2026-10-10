cask "vole" do
  version "0.1.0"
  sha256 "0e80d2106109e56fb79c0540e7bc79e78b67fa6566649aca737fc31c1663e58e"

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

  caveats <<~EOS
    Vole is ad-hoc signed and not notarized. If macOS blocks the first launch,
    open System Settings > Privacy & Security and click Open Anyway.
  EOS
end
