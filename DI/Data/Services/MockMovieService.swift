//
//  MockMovieService.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import Foundation

class MockMovieService : MovieServiceProtocol{
    
    func fetchMovies(completion: @escaping (Result<[Movie], any Error>) -> Void) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2){
            
            let mockMovies = [
                Movie(id: 1, title: "Inception", year: "2010"),
                Movie(id: 2, title: "The Dark Knight", year: "2008"),
                Movie(id: 3, title: "Interstellar", year: "2014")
                
            ]
            completion(.success(mockMovies))
            
        }
        
    }
    
}
