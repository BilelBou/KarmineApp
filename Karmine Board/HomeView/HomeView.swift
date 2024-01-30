//
//  HomeView.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 24/06/2023.
//

import SwiftUI

struct HomeView: View {
    @State var activeTab = 0

    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            VStack {
                TabsView()
                TabView(selection: $activeTab) {
                    ForEach(Karmine_Board.TabsView.allCases, id: \.title) { tab in
                        MatchesView(viewModel: tab.viewModel)
                            .tag(tab.index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            }
        }
    }

    @ViewBuilder
    func TabsView() -> some View {
        HStack(spacing: 20) {
            ForEach(Karmine_Board.TabsView.allCases, id: \.title) { tab in
                VStack {
                    Text(tab.title)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.semibold)
                        .onTapGesture {
                            self.activeTab = tab.index
                        }
                    if activeTab == tab.index {
                        Rectangle()
                            .frame(height: 2)
                    }
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
