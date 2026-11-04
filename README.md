# brunovskyoliver Homebrew tap

Install LocalFlow on a Mac with Apple silicon (macOS 14 or later):

```sh
brew install --cask brunovskyoliver/tap/localflow
```

Open it from Applications; it runs in the menu bar. Setup asks whether you want
meeting notes, dictation or both, and whether models run on this Mac or on a
LocalFlow server (paste the token its owner gives you). Meeting notes alone need no
shortcut or keyboard permissions.

LocalFlow is the Rust desktop app, ad-hoc signed and not notarized. The cask clears
the quarantine flag so it opens without the Open Anyway step. macOS may ask for
permissions again after an upgrade.

[Installation guide](https://github.com/brunovskyoliver/local_flow/blob/main/docs/distribution/homebrew.md)

## Vole

```sh
brew install --cask brunovskyoliver/tap/vole
```

macOS on Apple Silicon and Linux (x86-64 and arm64). On macOS it pulls in Homebrew `llvm` and `lld` for the guest assembler,
linker and C compiler, and links `vole-cli` onto your `PATH` (plus `vole` and a desktop launcher on Linux). Ad-hoc signed and
not notarized; the cask clears the quarantine flag so it opens without a prompt. The Vole cask is updated by
hand when a new release is published; the sync workflow below covers LocalFlow only.

## Maintenance

The sync workflow checks the latest public LocalFlow release hourly. It downloads
that release's generated `localflow.rb` and commits it to `Casks/localflow.rb`.
It can also be started manually from the Actions tab. No cross-repository token
or Apple signing credentials are required.
