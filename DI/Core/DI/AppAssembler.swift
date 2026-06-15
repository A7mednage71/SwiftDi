//
//  AppAssembler.swift
//  DI
//
//  Created by Ahmed Nageh on 15/06/2026.
//

import Foundation
import Swinject


class AppAssembler {

    static let shared = AppAssembler()
    let assembler : Assembler
    
    private init() {
        
        assembler = Assembler([
            MovieAssembly()
        ])
    }
    
    
    func resolveMovieService() -> MovieServiceProtocol {
        return assembler.resolver.resolve(MovieServiceProtocol.self)!
    }
    
    func resolveMovieRepository() -> MovieRepositoryProtocol {
        return assembler.resolver.resolve(MovieRepositoryProtocol.self)!
    }
    
    func resolveGetMoviesUseCase() -> GetMoviesUseCaseProtocol {
        return assembler.resolver.resolve(GetMoviesUseCaseProtocol.self)!
    }
    
    func resolveMovieViewModel() -> MovieViewModel {
        return assembler.resolver.resolve(MovieViewModel.self)!
    }
       
    func resolveMovieListViewFactory() -> MovieListViewFactoryProtocol {
        return assembler.resolver.resolve(MovieListViewFactoryProtocol.self)!
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        return assembler.resolver.resolve(type)!
    }
}



class MovieAssembly : Assembly {
    
    func assemble(container: Container) {
        
        container.register(MovieServiceProtocol.self){_ in
            return MockMovieService()
        }
            
        container.register(MovieRepositoryProtocol.self){ resolver in
            let service = resolver.resolve(MovieServiceProtocol.self)!
           return MovieRepository(movieService: service)
        }
        
        container.register(GetMoviesUseCaseProtocol.self){ resolver in
            let repository = resolver.resolve(MovieRepositoryProtocol.self)!
            return GetMoviesUseCase(repository: repository)
        }
        
        container.register(MovieViewModel.self) { resolver in
            let useCase = resolver.resolve(GetMoviesUseCaseProtocol.self)!
            return MovieViewModel(getMoviesUseCase: useCase)
        }
        
        container.register(MovieListViewFactoryProtocol.self) { resolver in
            return MovieListViewFactory(resolver: resolver)
        }
    }
}
