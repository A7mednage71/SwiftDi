//
//  MovieViewModel.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import Foundation

class MovieViewModel : ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    
    private let getMoviesUseCase: GetMoviesUseCaseProtocol
    
    init( getMoviesUseCase: GetMoviesUseCaseProtocol) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    
    func getMovies() {
        
        isLoading = true
        
        getMoviesUseCase.execute { [weak self] result in
            
            DispatchQueue.main.async {
                
              switch(result) {
                    
                case .success(let movies) :
                    self?.isLoading = false
                    self?.movies = movies
                    
                case .failure(let error) :
                    print("Error: \(error)")
                    
              }
                
            }
       }
        
    }
    
}
