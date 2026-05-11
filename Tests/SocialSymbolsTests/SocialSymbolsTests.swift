@testable import SocialSymbols
import XCTest
#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif

final class SocialSymbolsTests: XCTestCase {
    func testTypedLogoUsesAssetName() {
        XCTAssertEqual(SocialLogo.facebook.assetName, "facebook")
        XCTAssertEqual(SocialLogo.youtubeFill.assetName, "youtube.fill")
    }

    func testStringLookupSupportsDisplayNames() {
        XCTAssertEqual(SocialLogo.resolve("Facebook"), .facebook)
        XCTAssertEqual(SocialLogo.resolve("LinkedIn"), .linkedin)
        XCTAssertEqual(SocialLogo.resolve("TikTok Official"), .tiktokOfficial)
    }

    func testStringLookupNormalizesSeparatorsAndCase() {
        XCTAssertEqual(SocialLogo.resolve("made in amsterdam"), .madeInAmsterdam)
        XCTAssertEqual(SocialLogo.resolve("Mastodon Clean Fill"), .mastodonCleanFill)
        XCTAssertEqual(SocialLogo.resolve("x.twitter"), .xTwitter)
        XCTAssertEqual(SocialLogo.resolve("YOUTUBE.FILL"), .youtubeFill)
    }

    func testUnknownLogosFallBackToSystemSymbol() {
        let symbol = SocialSymbol(logo: "Unknown Brand")

        XCTAssertNil(symbol.resolvedLogo)
        XCTAssertEqual(SocialSymbol.fallbackSystemImageName, "questionmark.square.dashed")
    }

    func testPackageBuildsCompiledAssetCatalog() {
        let assetsCatalog = Bundle.module.url(forResource: "Assets", withExtension: "xcassets")
        let facebookSymbol = Bundle.module.url(
            forResource: "facebook",
            withExtension: "svg",
            subdirectory: "Assets.xcassets/symbols/facebook.symbolset"
        )

        XCTAssertNotNil(assetsCatalog)
        XCTAssertNotNil(facebookSymbol)
    }

    #if canImport(UIKit)
    func testUIKitImageLoadsTypedLogo() {
        XCTAssertNotNil(UIImage.socialSymbol(.facebook))
        XCTAssertNotNil(UIImage.socialSymbol(.snapchatFill))
    }

    func testUIKitImageLoadsFriendlyStringName() {
        XCTAssertNotNil(UIImage.socialSymbol(named: "LinkedIn"))
        XCTAssertNotNil(UIImage.socialSymbol(named: "Snapchat Fill"))
        XCTAssertNil(UIImage.socialSymbol(named: "Unknown Brand"))
    }
    #endif

    #if canImport(AppKit)
    func testAppKitImageAPICompilesForTypedLogo() {
        let facebook: NSImage? = NSImage.socialSymbol(.facebook)
        let snapchatFill: NSImage? = NSImage.socialSymbol(.snapchatFill)

        _ = facebook
        _ = snapchatFill
        XCTAssertTrue(true)
    }

    func testAppKitImageAPICompilesForFriendlyStringName() {
        let linkedin: NSImage? = NSImage.socialSymbol(named: "LinkedIn")
        let snapchatFill: NSImage? = NSImage.socialSymbol(named: "Snapchat Fill")

        _ = linkedin
        _ = snapchatFill
        XCTAssertTrue(true)
    }

    func testAppKitImageReturnsNilForUnknownName() {
        XCTAssertNil(NSImage.socialSymbol(named: "Unknown Brand"))
    }
    #endif
}
