//
//  ContentView.swift
//  Filmoteka
//
//  Created by mac on 13.09.2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var movieViewModel = MovieViewModel.shared
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(movieViewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                VStack {
                                    AsyncImage(url: movie.posterURL) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } placeholder: {
                                        Color.gray.opacity(0.2)
                                    }
                                    .frame(height: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text(movie.title)
                                        .font(.headline)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .foregroundColor(.primary)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
                .searchable(
                    text: $movieViewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Search")
                .onChange(of: movieViewModel.searchText) { oldValue, newValue in
                    movieViewModel.searchMovies()
                }
            }
            .navigationTitle("Movies")
            .onAppear {
                if movieViewModel.movies.isEmpty {
                    movieViewModel.loadPopularMovies()
                }
                
            }
        }
        
    }
}

#Preview {
    HomeView()
}
