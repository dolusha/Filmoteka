//
//  MainTabView.swift
//  Filmoteka
//
//  Created by mac on 15.09.2026.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Movies", systemImage: "popcorn")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .tint(.red)
    }
}
