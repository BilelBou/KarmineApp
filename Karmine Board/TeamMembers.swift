//
//  TeamMembers.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 21/06/2023.
//

import SwiftUI

struct TeamMembers: View {
    let players: [Player]

    var body: some View {
        ForEach(players) { player in
            HStack {
                AsyncImage(url: URL(string: player.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 70, height: 70)
                Text(player.slug)
            }
        }
        .padding()
    }
}

struct TeamMembers_Previews: PreviewProvider {
    static var previews: some View {
        TeamMembers(players: [Player(age: 20, birthday: "AAA", firstName: "Bilel", id: 123, imageURL: "", lastName: "Bouricha", modifiedAt: "", name: "KC BIBO", nationality: Location(rawValue: "FR")!, role: "Support", slug: "")])
    }
}

extension Player: Identifiable {}
