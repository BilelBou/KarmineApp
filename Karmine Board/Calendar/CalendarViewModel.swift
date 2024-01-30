//
//  CalendarViewModel.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 26/06/2023.
//

import Combine
import Foundation

extension URLComponents {

    static func karmineComingMatchesDetail(id: String) -> Self {
        let queryItems: [URLQueryItem] = [.init(name: "search[slug]", value: "karmine-corp")]
        return Self(path: "/matches/upcoming", queryItems: queryItems)
    }
}

extension URLRequest {
    static func karmineComingMatchesDetailRequest(acessToken: String, id: String) -> Self {
        Self(components: .karmineComingMatchesDetail(id: id))
            .add(httpMethod: .get)
            .add(headers: [
                "authorization": "Bearer \(acessToken)"
            ])
    }
}

final class CalendarViewModel: MatchesViewModel {

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
