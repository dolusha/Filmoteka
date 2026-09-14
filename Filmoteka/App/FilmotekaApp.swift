//
//  FilmotekaApp.swift
//  Filmoteka
//
//  Created by mac on 13.09.2026.
//

import SwiftUI
import SwiftData
@main
struct FilmotekaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [MovieEntity.self])
        }
    }
}
