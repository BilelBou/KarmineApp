//
//  CalendarView.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 26/06/2023.
//

import SwiftUI

struct MatchesView: View {
    @StateObject var viewModel: MatchesViewModel

    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            if let matches = viewModel.matches {
                if matches.isEmpty {
                    Text("No match found")
                }
                VStack {
                    HStack(spacing: 20) {
                        ForEach(Karmine_Board.GameTab.allCases, id: \.rawValue) { game in
                            GamesTabView(game: game)
                                .background {
                                    Capsule()
                                        .foregroundColor(viewModel.selectedGames.contains(game) ? Colors.clearBlue : Colors.blue)
                                }
                                .onTapGesture {
                                    if !viewModel.selectedGames.contains(game) {
                                        self.viewModel.selectedGames.append(game)
                                    } else {
                                        let index = self.viewModel.selectedGames.firstIndex(of: game) ?? 0
                                        self.viewModel.selectedGames.remove(at: index)
                                    }
                                }
                        }
                    }
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 0) {
                            ForEach(matches) { match in
                                HistoryItemView(match: match)
                                    .padding()
                            }
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            if viewModel.matches == nil {
                viewModel.getKCorpLoLHistory()
            }
        }
    }

    struct CalendarView_Previews: PreviewProvider {
        static var previews: some View {
            MatchesView(viewModel: HistoryViewModel(leagueRequest:  .karmineHistoryRequest(acessToken: "9acau15uxBEF2W_Qb4IcY8Lwgcs4tYCyuMzjFv1kLEGVd0Wu57g")))
        }
    }
}
