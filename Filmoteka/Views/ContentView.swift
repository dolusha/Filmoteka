//
//  ContentView.swift
//  Filmoteka
//
//  Created by mac on 13.09.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var movieViewModel = MovieViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    TextField("Search", text: $movieViewModel.searchText)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .accentColor(Color.primary)
                        .onSubmit {
                            movieViewModel.searchMovies()
                        }
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
            }
            .navigationTitle("Movies")
            .onAppear {
                movieViewModel.loadPopularMovies()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
