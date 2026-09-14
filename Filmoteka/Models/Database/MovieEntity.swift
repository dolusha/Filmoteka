//
//  FilmEntity.swift
//  Filmoteka
//
//  Created by mac on 14.09.2026.
//

import Foundation
import SwiftData
@Model
class MovieEntity {
    var id: Int
    var title: String
    var posterPath: String?
    
    init(id: Int, title: String, posterPath: String? = nil) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
    }
    init(movie: Movie) {
        id = movie.id
        title = movie.title
        posterPath = movie.posterPath
    }
    
}
