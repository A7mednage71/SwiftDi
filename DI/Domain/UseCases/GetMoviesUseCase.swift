//
//  GetMoviesUseCase.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import Foundation

protocol GetMoviesUseCaseProtocol {
    func execute(completion: @escaping (Result<[Movie], Error>) -> Void)
}

class GetMoviesUseCase: GetMoviesUseCaseProtocol {
    
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.getMoviesList(completion: completion)
    }
}
