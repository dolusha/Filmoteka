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
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(Constants.baseURL)/search/movie?api_key=\(Constants.apiKey)&query=\(encodedQuery)&language=ru-RU")
        else {
            throw NetworkError.invalidURL
        }
        
        let decodedData: MovieResponse = try await NetworkManager.fetch(url)
        return decodedData.results
    }
    
    func fetchPopularMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(Constants.baseURL)/movie/popular?api_key=\(Constants.apiKey)&language=ru-RU") else {
            throw NetworkError.invalidURL
        }
        
        let decodedData: MovieResponse = try await NetworkManager.fetch(url)
        return decodedData.results
    }
}
