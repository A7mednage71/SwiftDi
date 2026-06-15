//
//  DependencyContainer.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()
    private init() {}
    
    func resolveMovieService() -> MovieServiceProtocol {
        return MockMovieService()
    }
    
    func resolveMovieRepository() -> MovieRepositoryProtocol {
        return MovieRepository(movieService: resolveMovieService())
    }
    
    func resolveGetMoviesUseCase() -> GetMoviesUseCaseProtocol {
        return GetMoviesUseCase(repository: resolveMovieRepository())
    }
    
    func resolveMovieViewModel() -> MovieViewModel {
        return MovieViewModel(getMoviesUseCase: resolveGetMoviesUseCase())
    }
}


