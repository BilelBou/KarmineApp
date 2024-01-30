//
//  ViewModel.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 21/06/2023.
//

import Foundation
import Combine

extension URLComponents {

    static var karmineTeams: Self {
        Self(path: "/teams")
    }

    static func karmineTeamDetail() -> Self {
        let queryItems: [URLQueryItem] = [.init(name: "filter[finished]", value: "true")]
        return Self(path: "/teams/128268/matches", queryItems: queryItems)
    }
}

extension URLRequest {
    static var leagues: Self {
        Self(components: .karmineTeams)
    }

    static func karmineTeamDetail(acessToken: String) -> Self {
        Self(components: .karmineTeamDetail())
            .add(httpMethod: .get)
            .add(headers: [
                "authorization": "Bearer \(acessToken)"
            ])
    }
}

final class HistoryViewModel: ObservableObject {
    let request: URLRequest = .karmineTeamDetail(acessToken: "9acau15uxBEF2W_Qb4IcY8Lwgcs4tYCyuMzjFv1kLEGVd0Wu57g")
    private var cancellable = Set<AnyCancellable>()

    @Published var matches: [Match]?

    func getKCorpLoLHistory() {
        let responsePublisher = URLSession.shared.fetch(for: request, with: [Match].self)


        responsePublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { response in
                self.matches = response
                print(response)
            }
            .store(in: &cancellable)

    }
}
