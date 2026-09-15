//
//  FavoritesView.swift
//  Filmoteka
//
//  Created by mac on 15.09.2026.
//

import Foundation
import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MovieEntity.title) private var favoriteMovies: [MovieEntity]
    var body: some View {
        NavigationStack {
            Group {
                if favoriteMovies.isEmpty {
                    ContentUnavailableView(
                        "No favorite movies yet",
                        systemImage: "heart.slash",
                        description: Text("Liked movies will be appear here")
                    )
                } else {
                    List {
                        ForEach(favoriteMovies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie.toDomain())) {
                                HStack {
                                    AsyncImage(url: movie.toDomain().posterURL) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Color.gray.opacity(0.2)
                                    }
                                    .cornerRadius(12)
                                    .padding()
                                    Text(movie.title)
                                        .font(.headline)
                                }
                            }
                        }
                        .onDelete(perform: deleteMovies)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
    func deleteMovies(offsets: IndexSet) {
        for index in offsets {
            let deletedMovie = favoriteMovies[index]
            modelContext.delete(deletedMovie)
        }
    }
}

