//
//  MovieDetailView.swift
//  Filmoteka
//
//  Created by mac on 14.09.2026.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
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
                
                Text(movie.title)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
                Text(movie.overview)
                    .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Description")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
}
