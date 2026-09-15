//
//  MainTabBarVC.swift
//  Filmoteka
//
//  Created by mac on 15.09.2026.
//

import Foundation
import SwiftUI

struct MainTabBarVC: View {
    var body: some View {
        TabView {
            ContentView()
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
