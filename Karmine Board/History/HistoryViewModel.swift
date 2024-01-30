//
//  ViewModel.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 21/06/2023.
//

import Foundation
import Combine

extension URLComponents {

    static func karmineHistoryMatchDetail(page: String = "1") -> Self {
        let queryItems: [URLQueryItem] = [.init(name: "search[slug]", value: "karmine-corp"), .init(name: "page", value: page), .init(name: "per_page", value: "50")]
        return Self(path: "/matches/past", queryItems: queryItems)
    }
}

extension URLRequest {
    static func karmineHistoryRequest(acessToken: String, page: String = "1") -> Self {
        Self(components: .karmineHistoryMatchDetail(page: page))
            .add(httpMethod: .get)
            .add(headers: [
                "authorization": "Bearer \(acessToken)"
            ])
    }
}

final class HistoryViewModel: MatchesViewModel {

    override func getKCorpLoLHistory() {
        let responsePublisher = URLSession.shared.fetch(for: leagueRequest, with: [Match].self)

        responsePublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { response in
                self.matches = response
                self.savedMatches = response
            }
            .store(in: &cancellable)

    }
}
