//
//  ViewModel.swift
//  Social Symbols Showcase
//
//  Created by Jeremie Berduck on 04/02/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var symbols: [Symbol] = [
        .init(name: "Bluesky", file: "bluesky"),
        .init(name: "Discord", file: "discord"),
        .init(name: "Discord.fill", file: "discord.fill"),
        .init(name: "Discourse.fill", file: "discourse.fill"),
        .init(name: "Facebook", file: "facebook"),
        .init(name: "GitHub", file: "github"),
        .init(name: "Instagram", file: "instagram"),
        .init(name: "Linkedin", file: "linkedin"),
        .init(name: "Mastodon", file: "mastodon"),
        .init(name: "Made In Amsterdam", file: "made.in.amsterdam"),
        .init(name: "Mastodon.fill", file: "mastodon.fill"),
        .init(name: "Mastodon Clean", file: "mastodon.clean"),
        .init(name: "Mastodon Clean.fill", file: "mastodon.clean.fill"),
        .init(name: "Matrix", file: "matrix"),
        .init(name: "Reddit", file: "reddit"),
        .init(name: "Reddit.fill", file: "reddit.fill"),
        .init(name: "Slack", file: "slack"),
        .init(name: "Telegram", file: "telegram"),
        .init(name: "Tiktok", file: "tiktok"),
        .init(name: "Tiktok Official", file: "tiktok-official"),
        .init(name: "Threads", file: "threads"),
        .init(name: "Twitch", file: "twitch"),
        .init(name: "Twitter", file: "twitter"),
        .init(name: "X-Twitter", file: "x-twitter"),
        .init(name: "Tweetie", file: "tweetie"),
        .init(name: "YouTube", file: "youtube"),
        .init(name: "YouTube.fill", file: "youtube.fill")
    ]
}
