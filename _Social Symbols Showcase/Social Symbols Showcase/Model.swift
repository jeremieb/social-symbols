//
//  Model.swift
//  Social Symbols Showcase
//
//  Created by Jeremie Berduck on 04/02/2023.
//

import SwiftUI

struct Symbol: Identifiable {
    var id = UUID()
    var name: String
    var file: String
}

struct FontStyle: Identifiable {
    var id = UUID()
    var name: String
    var style: Font
}
