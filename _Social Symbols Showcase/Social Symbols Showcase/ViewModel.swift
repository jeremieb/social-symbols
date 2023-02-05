//
//  ViewModel.swift
//  Social Symbols Showcase
//
//  Created by Jeremie Berduck on 04/02/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var symbols: [Symbol] = [
        .init(name: "Discord", file: "discord"),
        .init(name: "Discord.fill", file: "discord.fill"),
        .init(name: "Discourse.fill", file: "discourse.fill"),
        .init(name: "GitHub.fill", file: "github.fill"),
        .init(name: "Mastodon", file: "mastodon"),
        .init(name: "Mastodon.fill", file: "mastodon.fill"),
        .init(name: "Mastodon Clean", file: "mastodon.clean"),
        .init(name: "Mastodon Clean.fill", file: "mastodon.clean.fill"),
        .init(name: "YouTube", file: "youtube"),
        .init(name: "YouTube.fill", file: "youtube.fill")
    ]
}
