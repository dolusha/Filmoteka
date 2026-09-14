//
//  Movie.swift
//  Filmoteka
//
//  Created by mac on 13.09.2026.
//

import Foundation
import SwiftUI

struct MovieResponse: Codable {
    let results: [Movie]
}
struct Movie: Identifiable, Codable {
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
    }
    
    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
struct Constants {
    static let apiKey = "2911f8276e47b3f11fefc3ebd9203e2f"
    static let baseURL = "https://api.themoviedb.org/3"
    
}
