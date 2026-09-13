//
//  MovieService.swift
//  Filmoteka
//
//  Created by mac on 13.09.2026.
//

import Foundation

class MovieAPIService {
    static let shared = MovieAPIService()
    
    func fetchMovies(query: String) async throws -> [Movie] {
        guard let url = URL(string: "\(constants.baseURL)/search/movie?api_key=\(constants.apiKey)&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&language=ru-RU") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(MovieResponse.self, from: data)
        return decodedData.results
    }
    func fetchPopularMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(constants.baseURL)/movie/popular?api_key=\(constants.apiKey)&language=ru-RU") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(MovieResponse.self, from: data)
        return decodedData.results
    }
}
