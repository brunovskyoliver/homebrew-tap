# LocalFlow Homebrew tap

Install LocalFlow on Apple Silicon with:

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
or Apple signing credentials are required.
