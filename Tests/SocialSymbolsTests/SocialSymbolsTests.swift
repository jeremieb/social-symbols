@testable import SocialSymbols
import XCTest

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
}
