//
//  MatchesViewModel.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 07/01/2024.
//

import Foundation
import Combine

class MatchesViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    @Published var selectedGames: [GameTab] = []
    @Published var matches: [Match]? = nil
    var savedMatches: [Match] = []
    let leagueRequest: URLRequest
    var filterGame: String = "none"

    init(cancellable: Set<AnyCancellable> = Set<AnyCancellable>(), matches: [Match]? = nil, leagueRequest: URLRequest) {
        self.cancellable = cancellable
        self.matches = matches
        self.leagueRequest = leagueRequest
        configureSubscribers()
    }

    func getKCorpLoLHistory() {}

    func filter() {
        var games: [String] = []
        for game in selectedGames {
            games.append(game.rawValue)
        }
        self.matches = savedMatches.filter { games.contains($0.videogame.name) }
    }

    func reset() {
        self.matches = savedMatches
    }

    func configureSubscribers() {
        $selectedGames
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { games in
                if games.isEmpty {
                    self.reset()
                } else {
                    self.filter()
                }
            }
            .store(in: &cancellable)

    }
}
