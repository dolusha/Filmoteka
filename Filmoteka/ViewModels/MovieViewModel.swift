//
//  MovieViewModel.swift
//  Filmoteka
//
//  Created by mac on 13.09.2026.
//

import Foundation
import SwiftUI
@Observable
class MovieViewModel {
    var movies: [Movie] = []
    var searchText: String = ""
    
    init() {
        loadPopularMovies()
    }
    func loadPopularMovies() {
        Task {
            do {
                movies = try await MovieAPIService.shared.fetchPopularMovies()
            } catch {
                print("Error loading: \(error.localizedDescription)")
            }
        }
    }
    func searchMovies() {
        Task {
            do {
                if searchText.isEmpty {
                    loadPopularMovies()
                } else {
                    movies = try await MovieAPIService.shared.fetchMovies(query: searchText)
                }
            } catch {
                print("Error searching: \(error.localizedDescription)")
            }
        }
    }
}
