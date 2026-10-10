cask "vole" do
  version "0.1.1"
  sha256 arm:          "a52eba4fb535b079434ed411d40b697c2ad34bebb23a5bfe1cfff51a9a9e836a",
         x86_64_linux: "e812c0fb4b896bbdf0bf82c29c57bb811691c192b514508dba750bd9c1a018d8"

  on_macos do
    url "https://github.com/brunovskyoliver/vole/releases/download/v#{version}/Vole-#{version}-arm64.zip"

    depends_on arch: :arm64
    depends_on macos: :ventura

    app "Vole.app"
    binary "#{appdir}/Vole.app/Contents/MacOS/vole-cli"
    # Ad-hoc signed, not notarized: macOS kills quarantined copies of vole-cli
    # outright, so drop the flag on this self-published build.
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Vole.app"],
                            writable_paths: ["Vole.app"], writable_base: :appdir
    end
  end
  on_linux do
    url "https://github.com/brunovskyoliver/vole/releases/download/v#{version}/vole-#{version}-linux-x64.tar.gz"

    depends_on arch: :x86_64

    binary "vole/vole"
    binary "vole/vole-cli"
    artifact "vole/dev.vole.Workbench.desktop",
             target: "~/.local/share/applications/dev.vole.Workbench.desktop"
    artifact "vole/vole.png",
             target: "~/.local/share/icons/hicolor/256x256/apps/dev.vole.Workbench.png"
  end

  name "Vole"
  desc "Workbench for assembling, compiling and stepping through machine code"
  homepage "https://github.com/brunovskyoliver/vole"

  # The assembler, linker and C compiler Vole drives.
  depends_on formula: "lld"
  depends_on formula: "llvm"
end
