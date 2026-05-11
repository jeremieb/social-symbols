import Foundation
import SwiftUI

public struct SocialSymbol: View {
    static let fallbackSystemImageName = "questionmark.square.dashed"
    private static let isRunningTests = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil

    let resolvedLogo: SocialLogo?

    public init(logo: String) {
        let resolvedLogo = SocialLogo.resolve(logo)
        #if DEBUG
        if resolvedLogo == nil && !Self.isRunningTests {
            fputs("Warning: Unknown social logo '\(logo)'.\n", stderr)
        }
        #endif
        self.resolvedLogo = resolvedLogo
    }

    public init(_ logo: SocialLogo) {
        resolvedLogo = logo
    }

    public var body: some View {
        Group {
            if let resolvedLogo {
                resolvedLogo.image
            } else {
                Image(systemName: Self.fallbackSystemImageName)
            }
        }
    }
}

public enum SocialLogo: String, CaseIterable {
    case bluesky
    case discord
    case discordFill = "discord.fill"
    case discourseFill = "discourse.fill"
    case facebook
    case github
    case instagram
    case koFi = "ko-fi"
    case linkedin
    case madeInAmsterdam = "made.in.amsterdam"
    case mastodon
    case mastodonClean = "mastodon.clean"
    case mastodonCleanFill = "mastodon.clean.fill"
    case mastodonFill = "mastodon.fill"
    case matrix
    case microblog
    case patreon
    case reddit
    case redditFill = "reddit.fill"
    case slack
    case snapchat
    case snapchatFill = "snapchat.fill"
    case telegram
    case threads
    case tiktok
    case tiktokOfficial = "tiktok-official"
    case tweetie
    case twitch
    case twitter
    case xTwitter = "x-twitter"
    case youtube
    case youtubeFill = "youtube.fill"

    public var assetName: String {
        rawValue
    }

    var image: Image {
        #if canImport(UIKit)
        if let uiImage = UIImage(named: assetName, in: .module, compatibleWith: nil) {
            Image(uiImage: uiImage)
        } else {
            Image(systemName: SocialSymbol.fallbackSystemImageName)
        }
        #elseif canImport(AppKit)
        if let nsImage = Bundle.module.image(forResource: assetName) {
            Image(nsImage: nsImage)
        } else {
            Image(systemName: SocialSymbol.fallbackSystemImageName)
        }
        #else
        Image(assetName, bundle: .module)
        #endif
    }

    public var displayName: String {
        switch self {
        case .bluesky:
            "Bluesky"
        case .discord:
            "Discord"
        case .discordFill:
            "Discord.fill"
        case .discourseFill:
            "Discourse.fill"
        case .facebook:
            "Facebook"
        case .github:
            "GitHub"
        case .instagram:
            "Instagram"
        case .koFi:
            "Ko-fi"
        case .linkedin:
            "LinkedIn"
        case .madeInAmsterdam:
            "Made In Amsterdam"
        case .mastodon:
            "Mastodon"
        case .mastodonClean:
            "Mastodon Clean"
        case .mastodonCleanFill:
            "Mastodon Clean.fill"
        case .mastodonFill:
            "Mastodon.fill"
        case .matrix:
            "Matrix"
        case .microblog:
            "Micro.blog"
        case .patreon:
            "Patreon"
        case .reddit:
            "Reddit"
        case .redditFill:
            "Reddit.fill"
        case .slack:
            "Slack"
        case .snapchat:
            "Snapchat"
        case .snapchatFill:
            "Snapchat.fill"
        case .telegram:
            "Telegram"
        case .threads:
            "Threads"
        case .tiktok:
            "TikTok"
        case .tiktokOfficial:
            "TikTok Official"
        case .tweetie:
            "Tweetie"
        case .twitch:
            "Twitch"
        case .twitter:
            "Twitter"
        case .xTwitter:
            "X-Twitter"
        case .youtube:
            "YouTube"
        case .youtubeFill:
            "YouTube.fill"
        }
    }

    static func resolve(_ name: String) -> SocialLogo? {
        lookup[normalize(name)]
    }

    private static let lookup: [String: SocialLogo] = {
        var values: [String: SocialLogo] = [:]

        for logo in allCases {
            for alias in logo.lookupAliases {
                values[normalize(alias)] = logo
            }
        }

        return values
    }()

    private var lookupAliases: [String] {
        var aliases = [rawValue, displayName]

        switch self {
        case .discordFill:
            aliases.append("Discord Fill")
        case .discourseFill:
            aliases.append("Discourse Fill")
        case .koFi:
            aliases.append("Ko Fi")
        case .madeInAmsterdam:
            aliases.append("Made in Amsterdam")
        case .mastodonClean:
            aliases.append("Mastodon.Clean")
        case .mastodonCleanFill:
            aliases.append(contentsOf: ["Mastodon Clean Fill", "Mastodon.Clean.Fill"])
        case .mastodonFill:
            aliases.append("Mastodon Fill")
        case .microblog:
            aliases.append("Micro Blog")
        case .redditFill:
            aliases.append("Reddit Fill")
        case .snapchatFill:
            aliases.append("Snapchat Fill")
        case .tiktokOfficial:
            aliases.append("TikTokOfficial")
        case .xTwitter:
            aliases.append(contentsOf: ["X Twitter", "X"])
        case .youtubeFill:
            aliases.append("YouTube Fill")
        default:
            break
        }

        return aliases
    }

    private static func normalize(_ name: String) -> String {
        let scalars = name
            .folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current)
            .unicodeScalars
            .filter(CharacterSet.alphanumerics.contains)

        return String(String.UnicodeScalarView(scalars))
    }
}
