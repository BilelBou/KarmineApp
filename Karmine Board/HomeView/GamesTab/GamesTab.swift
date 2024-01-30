//
//  GamesTab.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 07/01/2024.
//

import Foundation

enum GameTab: String, CaseIterable {
    case leagueOfLegend = "LoL"
    case valorant = "Valorant"
    case rocketLeague = "Rocket League"

    var image: String {
        switch self {
        case .leagueOfLegend:
            return "lol-illustration"
        case .valorant:
            return "valo-illustration"
        case .rocketLeague:
            return "rl-illustration"
        }
    }
}
