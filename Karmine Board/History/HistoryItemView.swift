//
//  HistoryItemView.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 22/06/2023.
//

import SwiftUI
import CachedAsyncImage

struct HistoryItemView: View {
    let match: Match

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(DateStringHelper.extractDatetimeString(from: match.scheduledAt))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                    .foregroundColor(Colors.clearBlue)
                    .background(Colors.blue)
            }
            Rectangle()
                .frame(height: 3)
                .foregroundColor(Colors.blue)

            HStack {
                CachedAsyncImage(url: URL(string: match.league.imageURL ?? ""), content: { image in
                    image.resizable()
                        .scaledToFit()
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 44, height: 44)
                HStack(spacing: 20) {
                    CachedAsyncImage(url: URL(string: match.opponents.first!.opponent.imageURL ?? ""), content: { image in
                        image.resizable()
                            .scaledToFit()
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(width: 44, height: 44)
                    Text("\(String(match.results.first!.score)) - \(String(match.results.last!.score))")
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)

                    CachedAsyncImage(url: URL(string: match.opponents.last!.opponent.imageURL ?? ""), content: { image in
                        image.resizable()
                            .scaledToFit()
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(width: 44, height: 44)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.white)
        }
        .cornerRadius(20)
    }
}
