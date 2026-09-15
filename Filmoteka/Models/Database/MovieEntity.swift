//
//  MovieEntity.swift
//  Filmoteka
//
//  Created by mac on 14.09.2026.
//

import Foundation
import SwiftData
@Model
class MovieEntity {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    
    init(id: Int, title: String, overview: String, posterPath: String? = nil) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        self.posterPath = movie.posterPath
    }
    func toDomain() -> Movie {
        return Movie(
            id: self.id,
            title: self.title,
            overview: self.overview,
            posterPath: self.posterPath
        )
    }
}
