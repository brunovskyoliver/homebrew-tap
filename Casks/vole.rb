cask "vole" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:          "a52eba4fb535b079434ed411d40b697c2ad34bebb23a5bfe1cfff51a9a9e836a",
         arm64_linux:  "839b6c52c84a0269b63ee39a9cdcbd11a0962a229313eef1735155dee4f9db80",
         x86_64_linux: "3e1020a5275a34eb0efafb01349d5b11549ad22b6fe915c5c86ec7c2e2cfe3fd"

  on_macos do
    url "https://github.com/brunovskyoliver/vole/releases/download/v#{version}/Vole-#{version}-arm64.zip"

    depends_on arch: :arm64
    # Apple's toolchain has no llvm-mc or ld.lld, which ARM, x86 and C need.
    depends_on formula: "lld"
    depends_on formula: "llvm"
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
    url "https://github.com/brunovskyoliver/vole/releases/download/v#{version}/vole-#{version}-linux-#{arch}.tar.gz"

    binary "vole/vole"
    binary "vole/vole-cli"
    artifact "vole/dev.vole.Workbench.desktop",
             target: "~/.local/share/applications/dev.vole.Workbench.desktop"
    artifact "vole/vole.png",
             target: "~/.local/share/icons/hicolor/256x256/apps/dev.vole.Workbench.png"

    caveats <<~EOS
      ARM, x86 and C programs need llvm-mc, ld.lld and clang 14+ on PATH.
      Install them from your distro, e.g. on Arch:
        sudo pacman -S llvm lld clang
    EOS
  end

  name "Vole"
  desc "Workbench for assembling, compiling and stepping through machine code"
  homepage "https://github.com/brunovskyoliver/vole"
end
