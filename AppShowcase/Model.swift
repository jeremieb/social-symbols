//
//  Model.swift
//  Social Symbols Showcase
//
//  Created by Jeremie Berduck on 04/02/2023.
//

import SwiftUI
import SocialSymbols

struct Symbol: Identifiable {
    var id = UUID()
    var logo: SocialLogo

    init(logo: SocialLogo) {
        self.logo = logo
    }

    var name: String {
        logo.displayName
    }
}

struct FontStyle: Identifiable {
    var id = UUID()
    var name: String
    var style: Font
}
