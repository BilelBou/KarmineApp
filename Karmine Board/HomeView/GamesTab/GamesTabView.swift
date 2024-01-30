//
//  GamesTabView.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 07/01/2024.
//

import SwiftUI

struct GamesTabView: View {
    let game: GameTab
    var body: some View {
        Image(game.image)
            .resizable()
            .scaledToFit()
            .frame(width: 30)
            .padding(.horizontal, 30)
            .padding(.vertical, 4)
    }
}

#Preview {
    HStack {
        ForEach(Karmine_Board.GameTab.allCases, id: \.rawValue) { game in
            GamesTabView(game: game)
        }
    }
}
