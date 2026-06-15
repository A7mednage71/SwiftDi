//
//  MovieServiceProtocol.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import Foundation


protocol MovieServiceProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie],Error>) -> Void )
}
