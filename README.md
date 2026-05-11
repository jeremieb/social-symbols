# SocialSymbols

Social media and community logos shipped as SF Symbols through a Swift Package.

## Installation

Add this repository as a Swift Package dependency in Xcode or in `Package.swift`, then import `SocialSymbols` anywhere you use SwiftUI.

## Usage

```swift
import SocialSymbols
import SwiftUI

struct ProfileLinks: View {
    var body: some View {
        VStack(spacing: 24) {
            SocialSymbol(logo: "Facebook")
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
                .font(.largeTitle)

            SocialSymbol(.instagram)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.pink, .orange, .purple)
                .font(.title)
        }
    }
}
```

The package returns ordinary SwiftUI `Image`-backed symbol views, so standard modifiers continue to work:

- `.symbolRenderingMode(.monochrome)`
- `.symbolRenderingMode(.hierarchical)`
- `.symbolRenderingMode(.palette)`
- `.symbolRenderingMode(.multicolor)`
- `.foregroundColor(...)`
- `.foregroundStyle(...)`
- `.font(...)`

Unknown string names fall back to `questionmark.square.dashed`, and debug builds assert so bad names are easy to catch during development.

## Contributing a New Logo

If you want to add a new brand logo to the package, follow this exact workflow.

### 1. Add the original source SVG

Store the raw source file under `SVGFiles` in a folder named after the logo.

Examples:

- `SVGFiles/facebook/facebook.svg`
- `SVGFiles/reddit/reddit.fill.svg`
- `SVGFiles/tiktok/tiktok-official.svg`

Keep the filename aligned with the symbol name you want to expose in the package.

### 2. Add the package symbol asset

The Swift Package does not read directly from `SVGFiles`. It ships assets from:

- `Sources/SocialSymbols/Resources/Assets.xcassets/symbols`

Create a new symbol set folder there:

- `Sources/SocialSymbols/Resources/Assets.xcassets/symbols/<symbol-name>.symbolset`

Then add:

- the SVG file itself
- a `Contents.json` file matching the existing symbol set format

Example layout:

```text
Sources/SocialSymbols/Resources/Assets.xcassets/symbols/snapchat.symbolset/
├── Contents.json
└── snapchat.svg
```

The simplest approach is to copy an existing `.symbolset` folder and adapt it.

### 3. Register the logo in Swift

Update [SocialSymbol.swift](/Users/jeremieberduck/Developer/social-symbols/Sources/SocialSymbols/SocialSymbol.swift) so the new symbol is available through the public API.

Add:

- a new `SocialLogo` case
- the correct `displayName`
- any string aliases needed for friendly lookup

If your symbol name contains punctuation such as `.fill` or `-`, map it to a Swift-safe enum case and keep the original asset name in the raw value.

### 4. Update the README logo list

Add the new logo name to the `Available Logos` section in this file so package users can discover it.

### 5. Verify it locally

Run the package tests:

```bash
swift test
```

Then open the demo app project:

- `AppShowcase/AppShowcase.xcodeproj`

Run the `AppShowcase` scheme and confirm the symbol:

- renders correctly
- works with monochrome, hierarchical, palette, and multicolor modes where applicable
- scales correctly with `.font(...)`
- behaves correctly with `.foregroundColor(...)` or `.foregroundStyle(...)`

If the logo should appear in the demo list, also update [ViewModel.swift](/Users/jeremieberduck/Developer/social-symbols/AppShowcase/ViewModel.swift) or any related showcase code if needed.

### 6. Open a pull request

Your pull request should include:

- the raw SVG in `SVGFiles`
- the packaged symbol asset in `Sources/SocialSymbols/Resources/Assets.xcassets/symbols`
- the Swift API update in `SocialSymbol.swift`
- the README update

In the PR description, include:

- the brand or logo name
- whether this is a new logo or a variant like `.fill`
- screenshots from `AppShowcase` if the visual behavior is non-obvious
- any notes about rendering mode support, such as hierarchical-only or multicolor branding

### Contribution Checklist

- Raw SVG added under `SVGFiles`
- Matching `.symbolset` added under `Sources/SocialSymbols/Resources/Assets.xcassets/symbols`
- `SocialLogo` updated
- Friendly string lookup updated if needed
- README updated
- `swift test` passes
- `AppShowcase` renders the new symbol correctly

## Available Logos

- Bluesky
- Discord
- Discord.fill
- Discourse.fill
- Facebook
- GitHub
- Instagram
- Ko-fi
- LinkedIn
- Made In Amsterdam
- Mastodon
- Mastodon.fill
- Mastodon Clean
- Mastodon Clean.fill
- Matrix
- Micro.blog
- Patreon
- Reddit
- Reddit.fill
- Slack
- Snapchat
- Snapchat.fill
- Telegram
- Threads
- TikTok
- TikTok Official
- Tweetie
- Twitch
- Twitter
- X-Twitter
- YouTube
- YouTube.fill

## License

SocialSymbols is available under the Apache-2.0 license.
