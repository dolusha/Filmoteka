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
            VStack {
                AsyncImage(url: movie.posterUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .cornerRadius(12)
                .padding()
                
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
