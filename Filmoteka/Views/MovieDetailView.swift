//
//  MovieDetailView.swift
//  Filmoteka
//
//  Created by mac on 14.09.2026.
//

import Foundation
import SwiftUI
import SwiftData

struct MovieDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isLiked: Bool = false
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .cornerRadius(12)
                .padding()
                
                HStack {
                    Text(movie.title)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                    Button() {
                      toggleLike()
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 24))
                            .foregroundColor(isLiked ? .red : .gray)
                            .frame(width: 20, height: 20)
                            .padding()
                            .glassEffect(.clear)
                            .padding()
                    }
                }
                
                Text(movie.overview)
                    .padding()
                
                Spacer()
            }
            .onAppear {
               checkIfLiked()
            }
        }
        .navigationTitle("Description")
        .navigationBarTitleDisplayMode(.inline)
    }
    // MARK: SwiftData logic
    private func toggleLike() {
        let movieId = movie.id
        
        let descriptor = FetchDescriptor<MovieEntity>(
            predicate: #Predicate { $0.id == movieId }
        )
        
        do {
            let existingMovies = try modelContext.fetch(descriptor)
            
            if let movieToDelete = existingMovies.first {
                modelContext.delete(movieToDelete)
                isLiked = false
            } else {
                let newEntity = MovieEntity(movie: movie)
                modelContext.insert(newEntity)
                isLiked = true
            }
            
            try modelContext.save()
        } catch {
            print(error)
        }
    }
    private func checkIfLiked() {
        let movieId = movie.id
        
        let descriptor = FetchDescriptor<MovieEntity>(
            predicate: #Predicate { $0.id == movieId }
        )
        
        do {
            let existingMovies = try modelContext.fetch(descriptor)
            isLiked = !existingMovies.isEmpty
        } catch {
            print(error)
        }
    }
}

#Preview {
    
}
