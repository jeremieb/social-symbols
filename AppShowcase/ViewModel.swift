//
//  ViewModel.swift
//  Social Symbols Showcase
//
//  Created by Jeremie Berduck on 04/02/2023.
//

import Foundation
import SocialSymbols

class ViewModel: ObservableObject {
    @Published var symbols = SocialLogo.allCases.map(Symbol.init)
}
