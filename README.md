# LocalFlow Homebrew tap

The first application release is being prepared. Once it is published and the
cask is synced, install LocalFlow with:

```sh
brew install --cask brunovskyoliver/tap/localflow
```

LocalFlow is ad-hoc signed without an Apple Developer ID and is not notarized.
If macOS blocks the first launch and you trust the download, open System Settings
> Privacy & Security > Open Anyway after attempting to open LocalFlow once.
Updates may require renewed approval and privacy permissions.

[Installation guide](https://github.com/brunovskyoliver/local_flow/blob/main/docs/distribution/homebrew.md)

## Maintenance

The sync workflow checks the latest public LocalFlow release hourly. It downloads
that release's generated `localflow.rb` and commits it to `Casks/localflow.rb`.
It can also be started manually from the Actions tab. No cross-repository token
or Apple signing credentials are required. Until the first release exists,
there is no installable cask.
