//
//  MovieRepository.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMoviesList(completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MovieRepository: MovieRepositoryProtocol {
    
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
    func getMoviesList(completion: @escaping (Result<[Movie], Error>) -> Void) {
       
        movieService.fetchMovies { result in
            completion(result)
        }
    }
}
