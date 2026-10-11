# brunovskyoliver Homebrew tap

Install LocalFlow on Apple Silicon with:

```sh
brew install --cask brunovskyoliver/tap/localflow
```

LocalFlow is ad-hoc signed without an Apple Developer ID and is not notarized.
If macOS blocks the first launch and you trust the download, open System Settings
> Privacy & Security > Open Anyway after attempting to open LocalFlow once.
Updates may require renewed approval and privacy permissions.

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
