//
//  MovieDetailView.swift
//  Filmoteka
//
//  Created by mac on 14.09.2026.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
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
                        isLiked.toggle()
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
        }
        .navigationTitle("Description")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
}
