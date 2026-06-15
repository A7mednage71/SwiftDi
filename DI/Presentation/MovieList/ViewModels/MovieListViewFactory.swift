//
//  MovieListViewFactory.swift
//  DI
//
//  Created by Ahmed Nageh on 15/06/2026.
//

import Foundation
import Swinject

protocol MovieListViewFactoryProtocol {
    func makeMovieListView() -> MovieListView
}


class MovieListViewFactory : MovieListViewFactoryProtocol {
    
    private let resolver: Resolver
        
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    
    func makeMovieListView() -> MovieListView {
        let viewModel = resolver.resolve(MovieViewModel.self)!
        return MovieListView(viewModel: viewModel)
    }
}
